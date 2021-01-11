import java.util.Objects;

public class EmptyList<T>
   implements List<T>
{
   public boolean equals(final Object other)
   {  
      if (this == other)
      {  
         return true;
      }
      
      return other instanceof EmptyList;
   }

   public int hashCode()
   {
      return Objects.hash();
   }
}
