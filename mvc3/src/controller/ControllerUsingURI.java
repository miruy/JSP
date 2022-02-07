package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cmd.CommandHandler;
import cmd.NullHandler;

public class ControllerUsingURI extends HttpServlet {
	private static final String handlerClassName = null;
	private Map<String, CommandHandler> commandHandlerMap = 
			new HashMap<String, CommandHandler>();
	
	public void init() throws ServletException{
		String configFile = getInitParameter("configFile");
		Properties property = new Properties();
		FileInputStream fis = null;
		try {
			String configFilePath =
					getServletContext().getRealPath(configFile);
			fis = new FileInputStream(configFilePath);
			property.load(fis);
		}catch(IOException e) {
			throw new ServletException(e);
		}finally {
			if(fis != null) {
				try {
					fis.close();
				}catch(IOException e) {
					e.printStackTrace();
				}
			}
		}
		Iterator keyIt = property.keySet().iterator();
			while(keyIt.hasNext()) {
				String command = (String)keyIt.next();
				String handlerClassName = 
						property.getProperty(command);
				try {
					Class<?> handlerClass = 
							Class.forName(handlerClassName);
			
					CommandHandler handlerInstance = 
							(CommandHandler) handlerClass.newInstance();
			
						commandHandlerMap.put(
								command, handlerInstance);
				}catch(ClassNotFoundException e) {
					throw new ServletException(e);
				}catch(InstantiationException e) {
					throw new ServletException(e);
				}catch(IllegalAccessException e) {
					throw new ServletException(e);
				}
	
			}
		}
	
	protected void doGet(HttpServletRequest request,
						 HttpServletResponse response) 
			throws ServletException, IOException{
		processRequest(request, response);
	}
	
	protected void doPost(HttpServletRequest request,
						 HttpServletResponse response)
			throws ServletException, IOException{
		processRequest(request, response);
	}
	
	private void processRequest(HttpServletRequest request,
						 HttpServletResponse response)
			throws ServletException, IOException{
		
//      요청 파라미터에서 명령어 추출 
//		String command = request.getParameter("cmd");

		
//URI를 얻어와 명령어로 활용
		String command = request.getRequestURI();//요청 URI정보 
		if(command.indexOf(request.getContextPath()) == 0) {
			//ContextPath와 같은 요청이라면
			command = command.substring(request.getContextPath().length());
			//ContextPath를 제거하고 URI정보만 명령어(command)로 활용
		}
		
		CommandHandler handler = commandHandlerMap.get(command);
		if(handler == null) {
			handler = new NullHandler();
		}
		String viewPage = null;
		try {
			viewPage = handler.process(request, response);
		}catch(Throwable e) {
			throw new ServletException(e);
		}
		
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}







