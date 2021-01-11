import static org.junit.Assert.*;
import org.junit.*;

public class Part3Tests
{
   @Test
   public void testListLength1()
   {
      assertEquals(0, Part3.listLength(new EmptyList<>()));
   }

   @Test
   public void testListLength2()
   {
      assertEquals(3, Part3.listLength(
         new ListNode<>(3,
            new ListNode<>(1,
               new ListNode<>(2,
                  new EmptyList<>())))));
   }

   @Test
   public void testMap1()
   {
      List<Integer> expected = new EmptyList<>();

      assertEquals(expected, Part3.map(n -> n + 1,
                  new EmptyList<Integer>()));
   }

   @Test
   public void testMap2()
   {
      List<Integer> expected =
         new ListNode<>(4,
            new ListNode<>(2,
               new ListNode<>(3,
                  new EmptyList<>())));

      assertEquals(expected, Part3.map(n -> n + 1,
         new ListNode<>(3,
            new ListNode<>(1,
               new ListNode<>(2,
                  new EmptyList<>())))));
   }

   @Test
   public void testMap3()
   {
      List<String> expected =
         new ListNode<>("3",
            new ListNode<>("1",
               new ListNode<>("2",
                  new EmptyList<>())));

      assertEquals(expected, Part3.map(n -> Integer.toString(n),
         new ListNode<>(3,
            new ListNode<>(1,
               new ListNode<>(2,
                  new EmptyList<>())))));
   }
}
