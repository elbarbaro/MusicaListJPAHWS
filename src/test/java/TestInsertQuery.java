
import com.generation.musicalistjpahws.models.Artista;
import com.generation.musicalistjpahws.models.Cancion;
import com.generation.musicalistjpahws.models.Playlist;
import com.generation.musicalistjpahws.models.Usuario;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import org.junit.After;
import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Test;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author leolopez94
 */

public class TestInsertQuery {

    private static final String PERSISTENCE_UNIT_NAME = "MusicaListPU";
    
    private EntityManager entityManager;
    
    @Before
    public void testConnection(){
        EntityManagerFactory emf = 
                Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
        assertNotNull(emf);
        System.out.println("Se creo un EntityManagerFactory");
        entityManager = emf.createEntityManager();
        assertNotNull(entityManager);
        System.out.println("Se creo un EntityManager");
    }
    
    public void testCancionQuery(){
        /*EntityManagerFactory emf = 
                Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
        assertNotNull(emf);
        System.out.println("Se creo un EntityManagerFactory");
        EntityManager entityManager = emf.createEntityManager();
        assertNotNull(entityManager);
        System.out.println("Se creo un EntityManager");*/
        
        entityManager.getTransaction().begin();
        
        Artista cepillin = new Artista();
        cepillin.setNombre("Cepillin");
        cepillin.setResumen("Payaso de fiestas");
        cepillin.setGenero("Infantil");
        cepillin.setImagenUrl("https://musicalist.com/canciones/imagenes/cepillin.jpg");
        cepillin.setFechaRegistro(new Date());
        
        entityManager.persist(cepillin);
        
        assertTrue(cepillin.getId() > 0);
        System.out.println("Se persistio un objeto cancion");
        
        Cancion lasMañanitas = new Cancion();
        lasMañanitas.setNombre("Las mañanitas con Cepillin");
        lasMañanitas.setDuracion(2);
        lasMañanitas.setIdArtista(cepillin.getId());
        lasMañanitas.setFechaRegistro(new Date());
        
        entityManager.persist(lasMañanitas);
        
        assertTrue(lasMañanitas.getId() > 0);
        System.out.println("Se persistio un objeto artista");
        
        entityManager.getTransaction().commit();
        
        entityManager.close();
        
        assertFalse(entityManager.isOpen());
        System.out.println("Se cerro la conexión");
        
    }
    
    public void testCancion1(){
        
        Artista artista = entityManager.find(Artista.class, 2);
        assertNotNull(artista);
        
        Cancion cancion = new Cancion();
        cancion.setIdArtista(artista.getId());
        cancion.setNombre("Una segunda de cepillin");
        cancion.setDuracion(3);
        cancion.setArtista(artista);
        cancion.setFechaRegistro(new Date());
        
        
        entityManager.getTransaction().begin();
        
        entityManager.persist(cancion);
        assertTrue(cancion.getId() > 0);
        entityManager.getTransaction().commit();
        
        System.out.println("Se persistio el objeto");
    }
    
    //@Test
    public void testPlaylistCancionInsertQuery(){
        
        try{
            Cancion segundaCepillin = entityManager.find(Cancion.class, 4);
            assertNotNull(segundaCepillin);
            Playlist playlist = entityManager.find(Playlist.class, 1);
            assertNotNull(playlist);
            
            List<Cancion> canciones = playlist.getCanciones();
            
            int numeroCanciones = canciones.size();
            entityManager.getTransaction().begin();
            // Agregar la cancion a la playlist
            canciones.add(segundaCepillin);
            assertTrue(canciones.size() > numeroCanciones);
            // Enviar cambios a la base de datos
            entityManager.getTransaction().commit();
            System.out.println("Se agrego la cancion a la playlist");
            
        }catch(Exception e){
            e.printStackTrace();
            if(entityManager.getTransaction() != null){
                entityManager.getTransaction().rollback();
            }
        }
                
    }
    
    @After
    public void closeConnection(){
        entityManager.close();
        assertFalse(entityManager.isOpen());
        System.out.println("Se cerro la conexión");
    }
}
