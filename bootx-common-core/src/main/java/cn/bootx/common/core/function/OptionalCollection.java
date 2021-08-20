package cn.bootx.common.core.function;

import java.util.Collection;
import java.util.NoSuchElementException;
import java.util.Objects;
import java.util.function.Consumer;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.function.Supplier;

/**
 * 一个集合容器对象，它可能包含也可能不包含非空值。
 * 如果集合not null  &amp; not empty ，{@code isPresent()}将返回{@code true}和{@code get()}将返回该值。
 * <p>
 * {@code Optional}可以用来判断null 但是无法判断empty。{@code OptionalCollection}在null的基础上增加了empty
 *
 * @author network
 * @see java.util.Optional
 */
public final class OptionalCollection<T extends Collection<?>> {

    /**
     * 空实例
     */
    public static final OptionalCollection<? extends Collection<?>> EMPTY = new OptionalCollection<>();

    /**
     * 如果非空，则值;如果为空，表示不存在值
     */
    private final T value;

    /**
     * 空实例的构造方法
     */
    private OptionalCollection() {
        this.value = null;
    }

    /**
     * 创建一个OptionalCollection实例，没有任何值
     *
     * @param <T> 不存在的值类型
     * @return 空的OptionalCollection
     */
    public static <T extends Collection<?>> OptionalCollection<T> empty() {
        return (OptionalCollection<T>) EMPTY;
    }

    private OptionalCollection(T value) {
        // check null
        Objects.requireNonNull(value);

        // check empty
        if (value.isEmpty()) {
            throw new IllegalArgumentException();
        }
        this.value = value;
    }

    /**
     * 一个值 不为null 且 不为空 的 {@code OptionalCollection}
     *
     * @param <T>   值的类型
     * @param value 要被设置的value 不可以为null 且不看为空
     * @return 设置了value的{@code OptionalCollection}
     * @throws NullPointerException     value is null
     * @throws IllegalArgumentException value is empty
     */
    public static <T extends Collection<?>> OptionalCollection<T> of(T value) {
        return new OptionalCollection<>(value);
    }

    /**
     * 返回包含指定值的{@code OptionalCollection}，如果为null或empty，则返回空的{@code OptionalCollection}。
     *
     * @param <T>   value的类型
     * @param value 值，可以为空
     * @return 包含指定值的 {@code OptionalCollection}，如果值为空，则返回空的{@code OptionalCollection}
     */
    public static <T extends Collection<?>> OptionalCollection<T> ofEmptyOrNullable(T value) {
        return value == null || value.isEmpty() ? empty() : of(value);
    }

    /**
     * 如果 {@code OptionalCollection}中存在值, 则返回该值,否则抛出异常{@code NoSuchElementException}.
     *
     * @return {@code OptionalCollection}所持有的非null且非empty的值
     * @throws NoSuchElementException value is null or value is empty
     * @see OptionalCollection#isPresent()
     */
    public T get() {
        if (value == null || value.isEmpty()) {
            throw new NoSuchElementException("No value present");
        }
        return value;
    }

    /**
     * 值not null  &amp; not empty 返回 {@code true} , 否则返回{@code false}.
     *
     * @return 值存在且not null  &amp; not empty 返回 {@code true} , 否则返回{@code false}.
     */
    public boolean isPresent() {
        return value != null && !value.isEmpty();
    }

    /**
     * 如果值not null  &amp; not empty 则执行调用consumer 对该值进行消费操作，否则不执行任何操作
     *
     * @param consumer 值not null  &amp; not empty 需要执行的消费函数
     * @throws NullPointerException value 存在且{@code consumer}为空
     */
    public void ifPresent(Consumer<? super T> consumer) {
        if (value != null && !value.isEmpty()) {
            consumer.accept(value);
        }
    }

    /**
     * 如果值not null  &amp; not empty则返回该值，否则返回 {@code other}.
     *
     * @param other 在值为null或empty时需要返回的值，可以为null
     * @return 如果值not null  &amp; not empty则返回该值，否则返回 {@code other}.
     */
    public T orElse(T other) {
        return value != null && !value.isEmpty() ? value : other;
    }

    /**
     * 如果值not null  &amp; not empty 则返回该值，否则调用 {@code other} 函数，并返回函数的执行结果
     *
     * @param other 一个 {@code Supplier} 函数，如果值为null 或者empty的时候将会返回该函数执行结果
     * @return 值not null  &amp; not empty 则返回该值，否则调用 {@code other} 函数，并返回函数的执行结果
     * @throws NullPointerException 值不存在或者空，且{@code other}函数为空
     */
    public T orElseGet(Supplier<? extends T> other) {
        return value != null && !value.isEmpty() ? value : other.get();
    }

    /**
     * 返回包含的值，如果值not null  &amp;  not empty。否则抛出提供的异常
     *
     * @param <X>               要抛出的异常的类型
     * @param exceptionSupplier 要抛出异常的supplier函数
     * @return 值
     * @throws X                    value is null or value is empty
     * @throws NullPointerException value is null or value is empty and {@code exceptionSupplier} is null
     */
    public <X extends Throwable> T orElseThrow(Supplier<? extends X> exceptionSupplier) throws X {
        if (value != null && !value.isEmpty()) {
            return value;
        } else {
            throw exceptionSupplier.get();
        }
    }

    /**
     * 如果值not null  &amp; not empty，且值与{@code predicate}匹配，则返回包含了这些值的{@code OptionalCollection},否则返回一个空的{@code OptionalCollection}
     *
     * @param predicate 需要应用到值的{@code Predicate} 函数
     * @return 值存在，且值与{@code predicate}匹配，则返回包含了这些值的{@code OptionalCollection},否则返回一个空的{@code OptionalCollection}
     * @throws NullPointerException {@code predicate} is null
     */
    public OptionalCollection<T> filter(Predicate<? super T> predicate) {
        Objects.requireNonNull(predicate);
        if (!isPresent()) {
            return this;
        } else {
            return predicate.test(value) ? this : empty();
        }
    }

    /**
     * 如果值not null  &amp; not empty 则执行提供的function,如果结果function执行的结果不为null 则返回包含这些结果的{@code OptionCollection},否则返回空的{@code OptionCollection}
     *
     * @param <U>    映射函数的结果的类型
     * @param mapper 要应用于值的映射函数(如果值存在)
     * @return 值not null  &amp; not empty 则执行提供的function,如果结果function执行的结果不为null 则返回包含这些结果的{@code OptionCollection},否则返回空的{@code OptionCollection}
     * @throws NullPointerException 映射函数为null
     */
    public <U extends Collection<?>> OptionalCollection<U> map(Function<? super T, ? extends U> mapper) {
        Objects.requireNonNull(mapper);
        if (!isPresent()) {
            return empty();
        } else {
            return OptionalCollection.ofEmptyOrNullable(mapper.apply(value));
        }
    }

    /**
     * 如果值not null&amp;not empty 则执行提供的function,如果结果function执行的结果不为null 则返回包含这些结果的{@code OptionCollection},否则抛出异常
     *
     * @param <U>    {@code OptionalCollection} 返回的参数类型
     * @param mapper 需要应用与value的mapping function
     * @return 值not null&amp;not empty 则执行提供的function,如果结果function执行的结果不为null 则返回包含这些结果的{@code OptionCollection},否则返回空的{@code OptionCollection}
     * @throws NullPointerException if the mapping function is null or returns a null result
     */
    public <U extends Collection<?>> OptionalCollection<U> flatMap(Function<? super T, OptionalCollection<U>> mapper) {
        Objects.requireNonNull(mapper);
        if (!isPresent()) {
            return empty();
        } else {
            return Objects.requireNonNull(mapper.apply(value));
        }
    }

    /**
     * Indicates whether some other object is "equal to" this Optional. The
     * other object is considered equal if:
     * <ul>
     * <li>it is also an {@code Optional} and;
     * <li>both instances have no value present or;
     * <li>the present values are "equal to" each other via {@code equals()}.
     * </ul>
     *
     * @param obj an object to be tested for equality
     * @return {code true} if the other object is "equal to" this object
     * otherwise {@code false}
     */
    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }

        if (!(obj instanceof OptionalCollection)) {
            return false;
        }

        OptionalCollection<?> other = (OptionalCollection<?>) obj;
        return Objects.equals(value, other.value);
    }

    /**
     * Returns the hash code value of the present value, if any, or 0 (zero) if
     * no value is present.
     *
     * @return hash code value of the present value or 0 if no value is present
     */
    @Override
    public int hashCode() {
        return Objects.hashCode(value);
    }

    /**
     * Returns a non-empty string representation of this Optional suitable for
     * debugging. The exact presentation format is unspecified and may vary
     * between implementations and versions.
     *
     * @return the string representation of this instance
     * representation in the result. Empty and present Optionals must be
     * unambiguously differentiable.
     */
    @Override
    public String toString() {
        return value != null && !value.isEmpty()
                ? String.format("Optional[%s]", value)
                : "Optional.empty";
    }


}
