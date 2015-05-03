package ch.unige.idsi15.swisstool;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ch.unige.idsi15.swisstool.Duck;
import ch.unige.idsi15.swisstool.EntityManagerService;

@SuppressWarnings("serial")
public class NewDuck extends HttpServlet {
 
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
 
        EntityManager entityManager = EntityManagerService.get().createEntityManager();
        Duck duck = new Duck();
        /*
        duck.setTitle(req.getParameter("title"));
        duck.setDescription(req.getParameter("description"));
        duck.setLatitude(Double.parseDouble(req.getParameter("latitude")));
        duck.setLongitude(Double.parseDouble(req.getParameter("longitude")));
        duck.setAddress(req.getParameter("address"));
        duck.setIdqrcode(req.getParameter("idqrcode")); */
        try {
            entityManager.persist(duck);
        } finally {
            entityManager.close();
        }
        resp.sendRedirect("/SwissTool.jsp");
    }
}

