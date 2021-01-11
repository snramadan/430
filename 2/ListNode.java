import java.util.Objects;

public final class ListNode<T>
   implements List<T>
{
   private final T value;
   private final List<T> next;

   public ListNode(T value, List<T> next)
   {
      this.value = value;
      this.next = next;
   }

   public T value()
   {
      return this.value;
   }

   public List<T> next()
   {
      return this.next;
   }

   public boolean equals(final Object other)
   {
      if (this == other)
      {
         return true;
      }

      return other instanceof ListNode
         && Objects.equals(value, ((ListNode)other).value)
         && Objects.equals(next, ((ListNode)other).next);
   }

   public int hashCode()
   {
      return Objects.hash(value, next);
   }
}
