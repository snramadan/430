import java.util.function.Function;

public class Part3
{
   public static <T> int listLength(List<T> list)
   {
      // oops ... generics are imaginary at runtime, so instanceof is goofy
      if (list instanceof ListNode)
      {
         return 1 + listLength(((ListNode<T>)list).next());
      }
      else if (list instanceof EmptyList)
      {
         return 0;
      }
      else
      {
         throw new IllegalArgumentException("unexpected list type");
      }
   }

   public static <T,R> List<R> map(Function<T,R> f, List<T> list)
   {
      // use f.apply(arg) to call function f with argument arg
		// used the same template as the listLength
		if (list instanceof ListNode)
		{
			return new ListNode<>(f.apply(((ListNode<T>)list).value()), map(f, (((ListNode<T>)list).next())));
		}
		else if (list instanceof EmptyList)
		{
			return new EmptyList<>();
		}
		else
		{
			throw new IllegalArgumentException("unexpected list type");
		}
   }
}
