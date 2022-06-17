package com.proj.web.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.proj.web.service.WorkService;
import com.proj.web.vo.GalleryVO;
import com.proj.web.vo.LikeVO;
import com.proj.web.vo.MarketVO;
import com.proj.web.vo.MemberVO;
import com.proj.web.vo.ReplyVO;
import com.proj.web.vo.WorkVO;

@Repository
public class WorkDAO {
	
	final static Logger logger = LoggerFactory.getLogger(WorkDAO.class);
	
	@Autowired
	private SqlSession ss;
	
	public int galleryWrite(GalleryVO gallery) {
		WorkMapper wm = ss.getMapper(WorkMapper.class);
		int result = 0;

		try {
			result = wm.galleryWrite(gallery);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	public int workWrite(WorkVO work) {
		WorkMapper wm = ss.getMapper(WorkMapper.class);
		int result = 0;

		try {
			result = wm.workWrite(work);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	public int gallery_Seq() {
		WorkMapper wm = ss.getMapper(WorkMapper.class);
		int cnt = 0;
		try {
			cnt = wm.gallery_Seq();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return cnt;
	}
	
	public ArrayList<GalleryVO> gallerySelectAll(){
		
		WorkMapper wm = ss.getMapper(WorkMapper.class);
		ArrayList<GalleryVO> list = null;
		
		try {
			list = wm.gallerySelectAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	public WorkVO presentWork(int id){
		
		logger.info("다오 gallery_seq : {}", id);
		
		WorkMapper wm = ss.getMapper(WorkMapper.class);
		WorkVO work = null;
		
		try {
			work = wm.presentWork(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		logger.info("다오 work : {} ", work);
		
		return work;
		
	}
	
	public GalleryVO presentGallery(int id){
		
		WorkMapper wm = ss.getMapper(WorkMapper.class);
		GalleryVO gallery = null;
		
		try {
			gallery = wm.presentGallery(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return gallery;
		
	}
	
	public HashMap<String, Object> informationGalleryJsp(int id){
		
		WorkMapper wm = ss.getMapper(WorkMapper.class);
		HashMap<String, Object> map = null;
		
		try {
			map = wm.informationGalleryJsp(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		logger.info("테스트 가져온 map : {}",map);
		
		return map;
		
	}
	
	public ArrayList<HashMap<String, Object>> selectGalleryOne(int gallery_seq){
		
		WorkMapper wm = ss.getMapper(WorkMapper.class);
		ArrayList<HashMap<String, Object>> list = null;
		
		try {
			list = wm.selectGalleryOne(gallery_seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	public WorkVO selectWorkOne(HashMap<String , Object> map){
		
		WorkMapper wm = ss.getMapper(WorkMapper.class);
		WorkVO work = null;
		
		try {
			work = wm.selectWorkOne(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return work;
		
	}
	
	public ArrayList<HashMap<String, Object>> selectMyGallery(String member_id){
		
		WorkMapper wm = ss.getMapper(WorkMapper.class);
		ArrayList<HashMap<String, Object>> list = null;
		
		try {
			list = wm.selectMyGallery(member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	public int deleteGallery(int gallery_seq) {
		
		
		WorkMapper wm = ss.getMapper(WorkMapper.class);
		int cnt = wm.deleteGallery(gallery_seq);
		
		try {
			cnt = wm.deleteGallery(gallery_seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return cnt;
		
	}

	public int insertReply(ReplyVO reply) {
		WorkMapper wm = ss.getMapper(WorkMapper.class);
		int cnt = 0;
		try {
			cnt = wm.insertReply(reply);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	public ArrayList<ReplyVO> getReplyList(int gallery_seq) {
		WorkMapper wm = ss.getMapper(WorkMapper.class);
		ArrayList<ReplyVO> list = null;		
		try {
			list = wm.getReplyList(gallery_seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	public ArrayList<ReplyVO> getReplyList_5(int gallery_seq) {
		WorkMapper wm = ss.getMapper(WorkMapper.class);
		ArrayList<ReplyVO> list = null;		
		try {
			list = wm.getReplyList_5(gallery_seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	public int deleteReply(ReplyVO reply) {
		WorkMapper wm = ss.getMapper(WorkMapper.class);
		int cnt =0;
		try {
			cnt = wm.deleteReply(reply);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	public void updateReply(ReplyVO reply) {
		WorkMapper wm = ss.getMapper(WorkMapper.class);
		try {
			wm.updateReply(reply);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<HashMap<String, Object>> onlyMemberInformationGalleryJsp(String member_id){
		
		WorkMapper wm = ss.getMapper(WorkMapper.class);
		ArrayList<HashMap<String, Object>> list = null;
		
		try {
			list = wm.onlyMemberInformationGalleryJsp(member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}

	public ArrayList<HashMap<String, Object>> listGallery(HashMap<String, Object> map, int startRecord,
			int countPerPage) {
		WorkMapper wm = ss.getMapper(WorkMapper.class);
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		ArrayList<HashMap<String, Object>> gallerylist = null;
		try {
			gallerylist = wm.listGallery(map, rb);
			logger.info("다오 startRecord{}", startRecord);
			logger.info("다오 countPerPage{}", countPerPage);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return gallerylist;
	}
	
	public int getGalTotal(HashMap<String, Object> map) {
		WorkMapper wm = ss.getMapper(WorkMapper.class);
		int total = 0;
		try {
			total = wm.getGalTotal(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return total;
	}

	
	public void plusLike(int gallery_seq) {
		
		WorkMapper wm = ss.getMapper(WorkMapper.class);
		
		try {
			wm.plusLike(gallery_seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void minusLike(int gallery_seq) {
		
		WorkMapper wm = ss.getMapper(WorkMapper.class);
		
		try {
			wm.minusLike(gallery_seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public int likeCount(int gallery_seq) {

		WorkMapper wm = ss.getMapper(WorkMapper.class);
		int cnt = 0;
		
		try {
			cnt = wm.likeCount(gallery_seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
		
	}

	public void onLike(LikeVO like) {

		WorkMapper wm = ss.getMapper(WorkMapper.class);
		
		try {
			wm.onLike(like);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public void offLike(LikeVO like) {
		
		WorkMapper wm = ss.getMapper(WorkMapper.class);
		
		try {
			wm.offLike(like);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public int likeCheck(LikeVO like) {
		
		WorkMapper wm = ss.getMapper(WorkMapper.class);
		int cnt = 0;
		
		try {
			cnt = wm.likeCheck(like);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
		
	}
}
