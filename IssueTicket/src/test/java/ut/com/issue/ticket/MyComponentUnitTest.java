package ut.com.issue.ticket;

import org.junit.Test;
import com.issue.ticket.MyPluginComponent;
import com.issue.ticket.MyPluginComponentImpl;

import static org.junit.Assert.assertEquals;

public class MyComponentUnitTest
{
    @Test
    public void testMyName()
    {
        MyPluginComponent component = new MyPluginComponentImpl(null);
        assertEquals("names do not match!", "myComponent",component.getName());
    }
}