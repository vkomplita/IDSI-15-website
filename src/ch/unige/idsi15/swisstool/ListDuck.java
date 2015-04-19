package ch.unige.idsi15.swisstool;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
 
import javax.persistence.EntityManager;
import javax.persistence.Query;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import ch.unige.idsi15.swisstool.Duck;
import ch.unige.idsi15.swisstool.EntityManagerService;


@SuppressWarnings("serial")
public class ListDuck extends HttpServlet {
     
	
	/*private void fixHeaders(HttpServletResponse response) {
	    response.addHeader("Access-Control-Allow-Origin", "*");
	    response.addHeader("Access-Control-Allow-Methods", "GET, PUT, POST, OPTIONS, DELETE");
	    response.addHeader("Access-Control-Allow-Headers", "Content-Type");
	    response.addHeader("Access-Control-Max-Age", "86400");
	}
	
	protected void doOptions(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    fixHeaders(response);
	}*/
	
	
	
	
	
	
    @SuppressWarnings("unchecked")
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    	
 
        EntityManager entityManager = EntityManagerService.get().createEntityManager();
        List<Duck> ducks = null;
         
        try {
            Query duckQuery = entityManager.createQuery("select d from Duck d");
            ducks = new ArrayList<Duck>(duckQuery.getResultList());
        } finally {
            entityManager.close();
        }
         
        if (ducks != null & !ducks.isEmpty()) {
            resp.getWriter().println("Ducks:\n");
            for (Duck d : ducks) {
                resp.getWriter().println("Duck: "+ d.getTitle()+ " at "+ d.getAddress()+" description: "+ d.getDescription()+" lat "+ d.getLatitude() +" long "+ d.getLongitude());
            }
        } else {
            resp.getWriter().println("No ducks yet.");
        }
    }
}
