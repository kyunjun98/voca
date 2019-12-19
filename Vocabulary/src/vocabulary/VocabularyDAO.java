package vocabulary;

import java.sql.*;
import java.util.ArrayList;

import vocabulary.VocabularyDTO;

public class VocabularyDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;

	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1/voca?useSSL=true&verifyServerCertificate=false&serverTimezone=UTC";
	
	/******************************************************************************************/
	// DB연결
	/******************************************************************************************/
	void connect() {
		try {
			Class.forName(jdbc_driver);

			conn = DriverManager.getConnection(jdbc_url,"voca","1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/******************************************************************************************/
	// DB 연결해제
	/******************************************************************************************/
	void disconnect() {
		if(pstmt != null) { try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} if(conn != null) { try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 	@fn		public ArrayList<VocabularyDTO> getDBList() 
	 * 
	 *	@brief	초기 페이지 설정
	 *
	 *	@details
	 *
	 *	@author	권연준
	 *	@date	2019-10-08
	 
	 *	@param 	action=list
	 *
	 *	@remark	웹 페이지를 불러오기 위한 초기페이지 설정 [2019-10-08; 권연준] \n
	 *
	 */
	public ArrayList<VocabularyDTO> getDBList() {
		
		connect();
		
		ArrayList<VocabularyDTO> vocabularyList = new ArrayList<VocabularyDTO>();
		
		String sql = "select id, word, description from Vocabulary";

		try {
			
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

			while(rs.next()) {
				
				// DO 揶쏆빘猿� 占쎄문占쎄쉐
				VocabularyDTO vocabularyDTO = new VocabularyDTO();
				
				vocabularyDTO.setId(rs.getInt("id"));
				vocabularyDTO.setWord(rs.getString("word"));
				vocabularyDTO.setDescription(rs.getString("description"));
	
				vocabularyList.add(vocabularyDTO);
			}
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return vocabularyList;
	}

	/**
	 * 
	 * 	@fn		public boolean insertDB(VocabularyDTO vocabularyDTO)
	 * 
	 *	@brief 	입력페이지 설정
	 *	@details
	 *
	 *	@author	권연준
	 *	@date	2019-10-08
	 
	 *	@param 	action=add
	 *
	 *	@remark	폼에 입력된 값을 객체에 저장 [2019-10-08; 권연준] \n
	 *
	 */
	public boolean insertDB(VocabularyDTO vocabularyDTO) {
		
		connect();
		
		String sql ="insert into Vocabulary(word, description) values(?,?)";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,vocabularyDTO.getWord());
			pstmt.setString(2,vocabularyDTO.getDescription());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		} return true;
	}
	
	/**
	 * 
	 * 	@fn		VocabularyDTO getDB(int id)
	 * 
	 *	@brief 	상세 조회 페이지
	 *	@details
	 *
	 *	@author	권연준
	 *	@date	2019-10-08
	 
	 *	@param	action=edit
	 *
	 *	@remark	where를 이용한 조건검색 후 출력 [2019-10-08; 권연준] \n
	 *
	 */
	public VocabularyDTO getDB(int id) {
		
		connect();
		
		VocabularyDTO vocabularyDTO = new VocabularyDTO();
		
		String sql = "select * from Vocabulary where id = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			vocabularyDTO.setId(rs.getInt("id"));
			vocabularyDTO.setWord(rs.getString("word"));
			vocabularyDTO.setDescription(rs.getString("description"));
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		} return vocabularyDTO;
	}

	/**
	 *
	 * @fn 		public boolean updateDB(VocabularyDTO vocabularyDTO)
	 * 
	 * @brief 	수정페이지
	 *
	 * @author 	권연준
	 * @date 	2019-10-08
	 *
	 * @param 	action=update
	 *
	 * @remark	where를 이용해 조건에 충족되는 데이터를 List에 저장 후 화면에 표시	[2019-10-08; 권연준] \n
	 * 			update를 이용해 데이터 수정								[2019-10-08; 권연준] \n
	 *
	 */
	public boolean updateDB(VocabularyDTO vocabularyDTO) {
		
		connect();
		
		String sql ="update Vocabulary set word=?, description=? where id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,vocabularyDTO.getWord());
			pstmt.setString(2,vocabularyDTO.getDescription());
			pstmt.setInt(3,vocabularyDTO.getId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		} return true;
	}

	/**
	 *
	 * @fn 		public boolean deleteDB(int id)
	 * 
	 * @brief 	데이터 삭제
	 *
	 * @author 	권연준
	 * @date 	2019-10-08
	 *
	 * @param 	action=delete
	 *
	 * @remark	where를 이용한 데이터 조건삭제	[2019-10-08; 권연준] \n
	 *
	 */
	public boolean deleteDB(int id) {
		
		connect();
					
		String sql ="delete from Vocabulary where id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
		} return true;
	}
	
}

