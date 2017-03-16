package com.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.jdo.Query;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import com.dao.TToujijianliDAO;
import com.model.TToujijianli;
import com.model.TUser;
import com.opensymphony.xwork2.ActionSupport;

public class toudijianliAction extends ActionSupport
{
	private int id;
	private int zhaopinId;
	private int userId;
	private String toudishijian;
	
	private String message;
	private String path;
	private TToujijianliDAO toujijianliDAO;
	
//	public String toudijianliAdd()
//	{
//		Map session= ServletActionContext.getContext().getSession();
//		TUser user=(TUser)session.get("user");
//		
//		TToujijianli toujijianli=new TToujijianli();
//		toujijianli.setZhaopinId(zhaopinId);
//		toujijianli.setUserId(user.getUserId());
//		toujijianli.setToudishijian(new Date().toLocaleString());
//		toujijianli.setDel("no");
//		toujijianliDAO.save(toujijianli);
//		return "successAdd";
//	}
//	
	
	
	public String toudijianliAdd() throws ParseException
	{		
		String result="index";
		Map session= ServletActionContext.getContext().getSession();
		
		TUser user=(TUser)session.get("user");
		int type=user.getUserType();
		if(type==1){//��ְ��
		String sql="from TToujijianli where userId=? and del='no'";
		Object[] con={user.getUserId()};
	    List toudijianliList=toujijianliDAO.getHibernateTemplate().find(sql,con);
	    int[] idArray=new int[toudijianliList.size()];//����Ƹ�ľ�̖����һ�����M
		if(toudijianliList.size()!=0){
			
			for(int i=0;i<toudijianliList.size();i++){
				TToujijianli TToujijianli =(com.model.TToujijianli) toudijianliList.get(i);
				idArray[i]=TToujijianli.getZhaopinId();	
			}	
			//�����û��ļ���Ͷ�ݼ����������е�Id���뵽����idArray
			
			
			boolean flag=false;
			
			for(int i=0;i<idArray.length;i++){
				System.out.println(user.getUserId());
				int uId=user.getUserId();
				int zpId=zhaopinId;//��ȡǰ̨���ݵ�zhaopinId
				int zid=idArray[i];
				System.out.println(user.getUserId()==idArray[i]);
				
				if(zid==zpId){//�ж��Ƿ�Ͷ�ݹ������Ϊtrue����ʾͶ�ݹ�
					flag=true;
					TToujijianli tToujijianli=(TToujijianli) toudijianliList.get(i);
					TToujijianli toujijianli=new TToujijianli();
					
					String delivery=tToujijianli.getToudishijian();
					Date delDate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(delivery);
					long delTime=delDate.getTime();
					Date date =new Date();
					long nowTime=date.getTime();
					long thirtyDaysTime=30*24*60*60*1000l;//30���ʱ�������
					long differenceValue=(long)(nowTime-delTime);//�ϴ�Ͷ�ݵ���ǰ��ʱ���
					System.out.println(differenceValue);
					if(differenceValue<thirtyDaysTime){//�ж��Ƿ񳬹���ʮ��
						this.setMessage("30��֮���ǲ������ظ�Ͷ�ݵģ�");
						session.put("messa", "���Ѿ�Ͷ�ݼ����ˣ�30��֮���ǲ������ظ�Ͷ�ݣ�");
						result= "delivery";
					}else{
						
						int getId=tToujijianli.getId();
						tToujijianli.setId(getId);
						tToujijianli.setZhaopinId(zhaopinId);
						tToujijianli.setUserId(user.getUserId());
						System.out.println(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
						tToujijianli.setToudishijian(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
						tToujijianli.setDel("no");
						toujijianliDAO.attachDirtyTime(tToujijianli);//����Ͷ��ʱ��
						result="successAdd";
						}	
		
				}

			}
			
			if(!flag){//û��Ͷ�ݹ��㽫Ͷ�ݵ���Ϣ
				TToujijianli toujijianli=new TToujijianli();
				toujijianli.setZhaopinId(zhaopinId);
				toujijianli.setUserId(user.getUserId());
				toujijianli.setToudishijian(new Date().toLocaleString());
				toujijianli.setDel("no");
				toujijianliDAO.save(toujijianli);
				result="successAdd";
			}
		}else{//û��Ͷ�ݹ�����Ϣ
			TToujijianli toujijianli=new TToujijianli();
			toujijianli.setZhaopinId(zhaopinId);
			toujijianli.setUserId(user.getUserId());
			toujijianli.setToudishijian(new Date().toLocaleString());
			toujijianli.setDel("no");
			toujijianliDAO.save(toujijianli);
			this.setMessage("Ͷ�ݳɹ���");
			session.put("messa", "Ͷ�ݳɹ���");
			result="successAdd";
		}
		
		
	}else if(type==2){
		session.put("messa", "�Բ���������ҵ�û������ܽ������������");
		result= "delivery";
	}
		return result;
	}
	
	
	public String toudijianliMy()
	{
		Map session= ServletActionContext.getContext().getSession();
		TUser user=(TUser)session.get("user");
		String sql="from TToujijianli where userId=? and del='no'";
		Object[] con={user.getUserId()};
	    List toudijianliList=toujijianliDAO.getHibernateTemplate().find(sql,con);
		if(toudijianliList.size()==0){
			session.put("messa", "��������");
			//this.setPath("/admin/noData.jsp");	
			return "nodata";
		}else{
			Map request=(Map)ServletActionContext.getContext().get("request");
			request.put("toudijianliList", toudijianliList);
			return ActionSupport.SUCCESS;
			
			
		}
	}
	
	public String toudijianliMyDel()
	{
		TToujijianli toujijianli=toujijianliDAO.findById(id);
		toujijianli.setDel("yes");
		toujijianliDAO.attachDirty(toujijianli);
		
		this.setMessage("�����ɹ�");
		this.setPath("toudijianliMy.action");
		return "succeed";
	}
	
	
	public String toudijianliForzhiwei()
	{
		String result=""; 
		String sql="from TToujijianli where zhaopinId=? and del='no'";
		Object[] con={zhaopinId};
	    List toudijianliList=toujijianliDAO.getHibernateTemplate().find(sql,con);
	    if(toudijianliList.size()==0){
	    	Map session= ServletActionContext.getContext().getSession();
	    	session.put("messa","��������");
	    	result="nodata";
	    }else{
	    	Map request=(Map)ServletActionContext.getContext().get("request");
			request.put("toudijianliList", toudijianliList);
			result="success";
	    }
	    return result;
		
	}
	
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public String getMessage()
	{
		return message;
	}
	public void setMessage(String message)
	{
		this.message = message;
	}
	public String getPath()
	{
		return path;
	}
	public void setPath(String path)
	{
		this.path = path;
	}
	public String getToudishijian()
	{
		return toudishijian;
	}
	public void setToudishijian(String toudishijian)
	{
		this.toudishijian = toudishijian;
	}
	public TToujijianliDAO getToujijianliDAO()
	{
		return toujijianliDAO;
	}
	public void setToujijianliDAO(TToujijianliDAO toujijianliDAO)
	{
		this.toujijianliDAO = toujijianliDAO;
	}
	public int getUserId()
	{
		return userId;
	}
	public void setUserId(int userId)
	{
		this.userId = userId;
	}
	public int getZhaopinId()
	{
		return zhaopinId;
	}
	public void setZhaopinId(int zhaopinId)
	{
		this.zhaopinId = zhaopinId;
	}
	
}
