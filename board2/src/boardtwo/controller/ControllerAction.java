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
     * 10. 65행 : Map에서 iterater반복자 사용이 불간으하므로 Map의 메서드 들 entrySet() 또는 ketSet()메서드로 
     * 값을 세팅한 후 iterator반복자를 사용할 수 있다. 따라서 65행과 같은 코드 작성한 후 모든 클래스형을 받을 수있는 
     * Object클래스를 타입형으로 iterator객체인 keyIter 변수에 저장
     * 11. keyIter객체에 데이터가 있는 동안 (있을때까지)반복해서(while) command객체에 문자열 그대로 (String으로 받잖아)담은 후
     * 12. 75행 : iterator로 뽑은 데이터(CommandPro.properties의 초록 글씨를 문자열 그대로)(여기서는 결국 사용자가 웹브라우저의 url로 요청한 파일의 정보데이터)를 매개변수로 
     * 속성을 가져오는 (getProperty())로 ClassName이라는 변수에 담음
     * 13. 82행 : Class 클래스는 모든 클래스들의 정보를 갖고 있는 클래스로써 같은 이름을 찾는 메섣인 forName()를 이용하여 위에 사용자가 요청한 파일의 경로를 나타내는 String객체를 찾아 
     * 클래스로 만들어 commandClass객체에 담음(현재 commandClass는 사용자가 요청한 파일의 경로를 찾아 클래스로 만듬)
     * 14. 88행 : 13번에서 만든  클래스의 객체 생성 newInstance()는 생성자와 같은 역할 
     * 15. 92행 : 여기서 드디어 Map에 put()로 요청한 파일의 객체와 해당 파일 경로속성 정보(초록글씨 문자열 그대로)
     * 를 저장함 
     * ------------------여기까지가 사용자가 웹브라우저에 url로 요청한 파일을 찾아 접근한 후 
     * 					 다음 페이지로 응답해줄 수 있도록 준비한 과정-------------------------
     *사용자의 요청에 따라 요청방식이 get / post방식이 나뉘어지며 어느 요청 방식으로가도 
     *requestPro()라는 메서드를 호출하게 됨 
     *
     *URL과 URI의 차이 
     *URI가 URL, URN을 포함하고 있음 (URI 하위 - URL,URN)
     * URL : 자원의 위치
     * URI : 자원의 식별자
     *
     *16 . uri(사용자가 요청한 해당 파일의 식별정보)를 command변수에  가져와 저장 
     *17. 144헹 : command의 문자열과 (request.getContextPath())한 문자열의 첫번째가 같다면!
     *18. 문자열을 자르는 메서드 substring()로 request.getContextPath().length()의 길이까지 잘라 다시 command에 저장
     *19. 165행 : 딱 사용할 파일의 경로만큼만 자른 command객체를 Map의 get()로 값을 가져와 com변수에 담음 
     *(키 : command인거고 com변수에는 value값을 저장 )
     *20. 168행 : 마지막으로! view라는 문자열 객체에 정리된 요청객체와 응답객체를 담아 
     *21. 173행 : 포워드로 해당 view를 넣어 보냄 
     *여기서 포워드는 uri는 변하지 않고 창에 정보가 추가되는 방식으로 응답하는 것 
     *
     *
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
            pr.load(f);	//속성객체(pr)에 파일명과 경로를 객체로 생성해 저장한 빨대(f)를 담음  
        } catch(IOException e){
            throw new ServletException(e);
        } finally{
            if(f != null) try{ f.close(); } catch (IOException e){}
        }
        
//        Iterator 객체사용 반복자 
        Iterator<Object> keyIter = pr.keySet().iterator();
        
        while(keyIter.hasNext()){
            String command = (String)keyIter.next();
            String className = pr.getProperty(command);
            //여기 시점 사용자가 url에 요청한 파일의 속성정보(프로퍼티파일(속성값 정리해놓은 파일)초록글씨문자열그대로)를 찾아 CcassName변수에 담은 상황 
            
            try{
//                가져온 문자열을 클래스로 만듬
                Class<?> commandClass = Class.forName(className);
                
//                만들어진 해당 클래스의 객체 생성
                Object commandInstance = 
                        commandClass.newInstance(); 
                //newInstance() == new 생성자(); ->객체 생성메서드 
                
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
        CommandAction com = null;	//CommandAction : 내가만든 명령 작업 인터페이스 
        try{
            String command/* : 명렁*/ = request.getRequestURI(); //uri : ?뒤에 파라미터가 나오는 링크, 자원의 식별자 
            if(command.indexOf(request.getContextPath()) == 0){
            	// == 0 : command의 문자열과 (request.getContextPath())한 문자열의 첫번째가 같다면!
            	
//            	----------------------------------------
//            	 indexOf() : 특정 문자의 위치를 찾기
//            	 defalt : 0
//            	 커서 하나 이동 후 있으면 : 1
//            	 일치하는 문자없으면 : -1 
            	
//            	예제 : const str = "abab";
//
//            	document.writeln(str.indexOf('ab')); // 0
//            	document.writeln(str.indexOf('ba')); // 1
//            	document.writeln(str.indexOf('abc')); // -1
//            	document.writeln(str.indexOf('AB')); // -1
//            	------------------------------------------
            	
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















