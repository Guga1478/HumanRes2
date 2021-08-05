package ar.com.java.humanRes.utils.html;

import java.lang.reflect.Field;
import java.util.List;

public class HtmlTable <E>{
    public String getTable(List<E> list){
        if(list==null || list.isEmpty())return "<table></table>";
        String table="<table border=1 >";
        E e=list.get(0);
        Field[] campos=e.getClass().getDeclaredFields();
        table+="<tr>";
        for(Field c:campos){
            table+="<th>"+c.getName()+"</th>";
        }
        table+="</tr>";
        for(E x:list){
            table+="<tr>";
            for(Field c:campos){
                table+="<td>";
                   String method="get"+c.getName().substring(0, 1).toUpperCase()+c.getName().substring(1);
                   try {
                       table+=x.getClass().getDeclaredMethod(method, null).invoke(x, null);
                } catch (Exception ex) {
                       System.out.println("********");
                       System.out.println(ex);
                       System.out.println("********");
                }
                   table+="</td>";
            }
            table+="</tr>";
        }
        table+="</table>";
        return table;
    }
    
}
