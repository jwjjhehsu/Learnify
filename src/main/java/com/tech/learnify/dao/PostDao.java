package com.tech.learnify.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.tech.learnify.entities.Category;
import com.tech.learnify.entities.Post;

public class PostDao {

    private Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<>(); // Initialize the ArrayList
        String query = "SELECT * FROM categories"; // Use uppercase for SQL keywords

        try (Statement st = con.createStatement();
        		ResultSet rs = st.executeQuery(query)) {
            while (rs.next()) {
                int cid = rs.getInt("cid");
                String name = rs.getString("name");
                String description = rs.getString("description");

                Category c = new Category(cid, name, description);
                list.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log the exception
        }

        return list; // Return the populated list
    }
    
    
    
    public boolean savePost(Post p)


    {
    	boolean f = false;
    	try
    	{
    		
    		String query = "INSERT INTO posts (pTitle, pContent, pCode, pPic, catid, userId) VALUES (?, ?, ?, ?, ?, ?)";
    		PreparedStatement ps = con.prepareStatement(query);
    		ps.setString(1,p.getpTitle());
    		ps.setString(2, p.getpContent());
    		ps.setString(3, p.getpCode());
    		ps.setString(4, p.getpPic());
    		ps.setInt(5,  p.getCatId());
    		ps.setInt(6,  p.getUserId());
    		
    		
    		ps.executeUpdate();
    		
    		f = true;
    		
    		
    		
    		
    		 
    	}catch(Exception e )
    	{
    		e.printStackTrace();
    	}
    	return f;
    	
    	
    }

// get all the posts

public List<Post> getAllPosts()
{
	List<Post> list = new ArrayList<>();
	
	
	// Fetch all the posts
	try 
	{
		PreparedStatement ps = con.prepareStatement("select * from posts order by pid desc  ");
		ResultSet rs = ps.executeQuery();
		
		
		while(rs.next())
		{
			int pid= rs.getInt("pid");
			String pTitle = rs.getString("pTitle");
			String pContent = rs.getString("pContent");
			String pCode = rs.getString("pCode");
			String pPic = rs.getString("pPic");
			Timestamp date = rs.getTimestamp("pDate");
			int catId = rs.getInt("catid");
			int userId = rs.getInt("userId");
			
			
			Post ppost = new Post(pid, pTitle, pContent, pCode, pPic, date, catId,userId );
			
			
			list.add(ppost);
			
		}
		
	}catch(Exception e)
	{
		e.printStackTrace();
	}
	

	return list;
}


// get posts by catId
public List<Post> getPostByCatId(int catId)
{
//	fetch all posts trhough catId
	List<Post> list = new ArrayList<>();
	
	try 
	{
		PreparedStatement ps = con.prepareStatement("select * from posts where catId = ?   ");
		ps.setInt(1, catId);
		ResultSet rs = ps.executeQuery();
		
		
		while(rs.next())
		{
			int pid= rs.getInt("pid");
			String pTitle = rs.getString("pTitle");
			String pContent = rs.getString("pContent");
			String pCode = rs.getString("pCode");
			String pPic = rs.getString("pPic");
			Timestamp date = rs.getTimestamp("pDate");
			int catId1= rs.getInt("catid");
			int userId = rs.getInt("userId");
			
			
			Post ppost = new Post(pid, pTitle, pContent, pCode, pPic, date, catId1,userId );
			
			
			list.add(ppost);
			
		}
		
	}catch(Exception e)
	{
		e.printStackTrace();
	}
	

	return list;

}
	public Post getPostByPostId(int postId)
	{
		Post post=null;
		String q="select * from posts where pid=?";
		try
		{
			
		
		PreparedStatement p=this.con.prepareStatement(q);
		p.setInt(1, postId);
		ResultSet rs=p.executeQuery();
		if(rs.next()) 
		{
			int pid= rs.getInt("pid");
			String pTitle = rs.getString("pTitle");
			String pContent = rs.getString("pContent");
			String pCode = rs.getString("pCode");
			String pPic = rs.getString("pPic");
			Timestamp date = rs.getTimestamp("pDate");
			int catId1= rs.getInt("catid");
			int userId = rs.getInt("userId");
			
			
			post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId1,userId );
			
			
		}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return post;
	}
}