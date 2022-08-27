package cn.bootx.starter.flowable.util;

import cn.hutool.core.collection.CollUtil;
import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;
import org.flowable.bpmn.converter.BpmnXMLConverter;
import org.flowable.bpmn.model.BpmnModel;
import org.flowable.bpmn.model.ItemDefinition;
import org.flowable.bpmn.model.Process;
import org.flowable.validation.ProcessValidator;
import org.flowable.validation.ProcessValidatorFactory;
import org.flowable.validation.ValidationError;

import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.XMLStreamReader;
import java.io.ByteArrayInputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**   
* bpmnXml对象转换工具类
* @author xxm  
* @date 2020/3/27 15:21
*/
@Slf4j
@UtilityClass
public class BpmXmlUtil {

    /**
     * 将字节转换成Bpmn对象
     */
    public BpmnModel convertByte2BpmnModel(byte[] bytes){
        //创建转换对象
        try {
            //将xml文件转换成BpmnModel
            BpmnXMLConverter converter = new BpmnXMLConverter();
            XMLInputFactory factory = XMLInputFactory.newInstance();
            XMLStreamReader reader = factory.createXMLStreamReader(new ByteArrayInputStream(bytes));
            BpmnModel bpmnModel = converter.convertToBpmnModel(reader);

            //进行模型校验
            ProcessValidatorFactory processValidatorFactory = new ProcessValidatorFactory();
            ProcessValidator processValidator = processValidatorFactory.createDefaultProcessValidator();
            List<ValidationError> validate = processValidator.validate(bpmnModel);
            if (CollUtil.isNotEmpty(validate)){
                validate.forEach(error -> log.error(error.toString()));
                throw new RuntimeException("Bpmn文件校验失败");
            }
            return bpmnModel;
        } catch (XMLStreamException e) {
            log.error(e.getMessage(),e);
            throw new RuntimeException("Bpmn文件解析失败");
        }
    }

    /**
     * 将Bpmn对象转换xml字符串
     */
    public String convertBpmnModel2Str(BpmnModel bpmnModel){
        BpmnXMLConverter converter = new BpmnXMLConverter();
        byte[] bytes = converter.convertToXML(bpmnModel);
        return new String(bytes);
    }


    public static void main(String[] args){
        BpmnModel bpmnModel = new BpmnModel();
        Process mainProcess = new Process();
//        bpmnModel.addNamespace("extA1","http://www.a1bpm.com/schema/1.0/A1");
        mainProcess.setName("xxm");
        mainProcess.setId("xxaaa");

        bpmnModel.addNamespace("extA1","http://www.a1bpm.com/schema/1.0/A1");

        Map<String, ItemDefinition> itemDefinitionMap = new HashMap<>();

        bpmnModel.addProcess(mainProcess);
        System.out.println(convertBpmnModel2Str(bpmnModel));
    }
}
