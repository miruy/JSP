package boardtwo.controller;
 
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import boardtwo.action.CommandAction;
 
public class ControllerAction extends HttpServlet{
 
    private static final long serialVersionUID = 1L;
 
//    명령어와 명령어 처리 클래스를 쌍으로 저장해두는 MAP
    private Map<String, Object> commandMap = 
            new HashMap<String, Object>();
//    
//      명령어와 처리클래스가 매핑되어 있는 
//      properties파일(CommandPro.properties)을 읽어
//      Map객체인 commandMap에 저장한다.
//     
    /*
     * 1. 사용자가 url로 어떤 파일을 요청
     * 2. web.xml에서 해당 url의 마지막 명 (.do / .jsp 등)을 확인항 
     * 3. 마지막 명이 매핑되어 있는 것의 이름을 따라 이동 (controllerAction)
     * 4. controllerAction파일에서 초기화메서드인 init()를 실행 
     * 5-1. init()에서 42행 : propertyConfig를 매개변수로 초기화를 하여 props객체에 담음 
     * 5-2. 이때 propertyConfig 데어터가 있는 CommandPro.properties로 이동하여 1번에서 사용자가 요청한
     * url주소(여기서 키)와 맞는 value값을 문자열 그대로 가져와서 props객체에 저장하는 것 
     * 6. 우선 따로 pr이라는 Properties객체를 생성함 
     * 7. 50행 : 내가만든 프로젝트의 경로를 알려주는 코드로 path라는 객체에 저장 
     * 8. FileInputStream라는 빨대 객체를 이용하여 f라는 빨대 객체에 해당파일의 경로와 파일명을 담음 
     * 9. 57행 : 으로 그 빨대 객체를 6번에서 만든 객체에 담음으로써 MAP 클래스의 키와 밸류로 저장
     * */
//    web.xml에서 propertyConfig에 해당하는 init-param의 값을 읽어온다.
    public void init(ServletConfig config) throws ServletException{
        String props = config.getInitParameter("propertyConfig");
        
//        명령어와 커리클래스의 매핑 정보를 저장할 Properties객체 생성
        Properties pr = new Properties();
        FileInputStream f = null;
        String path = config.getServletContext().getRealPath("/WEB-INF");
        try{
            f = new FileInputStream(new File(path, props));
            
//            Command.properties파일의 정보를 Properties객체에 저장
            pr.load(f);
        } catch(IOException e){
            throw new ServletException(e);
        } finally{
            if(f != null) try{ f.close(); } catch (IOException e){}
        }
        
//        Iterator 객체사용
        Iterator<Object> keyIter = pr.keySet().iterator();
        
        while(keyIter.hasNext()){
            String command = (String)keyIter.next();
            String className = pr.getProperty(command);
            try{
//                가져온 문자열을 클래스로 만듬
                Class<?> commandClass = Class.forName(className);
                
//                만들어진 해당 클래스의 객체 생성
                Object commandInstance = 
                        commandClass.newInstance(); 
                
//                생성된 객체를 commandMap에 저장
                commandMap.put(command, commandInstance);
            } catch(ClassNotFoundException e){
                throw new ServletException(e);
            } catch(InstantiationException e){
                throw new ServletException(e);
            } catch(IllegalAccessException e){
                throw new ServletException(e);
            }
        }
    }
    
//    Get방식 서비스 메서드
    public void doGet(
            HttpServletRequest request, 
            HttpServletResponse response) 
                    throws ServletException, IOException{
        requestPro(request, response);
    }
    
//    Post방식 서비스 메서드
    public void doPost(
            HttpServletRequest request, 
            HttpServletResponse response) 
                    throws ServletException, IOException{
        requestPro(request, response);
    }
    
//    사용자의 요청에 따라 분석하여 해당 작업을 처리
    private void requestPro(
            HttpServletRequest request,
            HttpServletResponse response)
                    throws ServletException, IOException{
        String view = null;
        CommandAction com = null;
        try{
            String command = request.getRequestURI();
            if(command.indexOf(request.getContextPath()) == 0){
                command = command.substring(
                        request.getContextPath().length());
            }
            com = (CommandAction)commandMap.get(command);
            view = com.requestPro(request, response);
        } catch(Throwable e){
            throw new ServletException(e);
        }
        RequestDispatcher dispatcher = 
                request.getRequestDispatcher(view);
        dispatcher.forward(request, response);
    }
}















