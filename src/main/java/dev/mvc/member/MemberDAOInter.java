package dev.mvc.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface MemberDAOInter {
  
  /**
   * 회원 가입
   * @param memberVO
   * @return
   */
  public int create(MemberVO memberVO );
  
  /**
   * 중복 아이디 검사
   * @param id
   * @return 중복 아이디 갯수
   */
  public int checkID(String id);
  
  /**
   * 회원 전체 목록
   * @return
   */
  public List<MemberVO> list();
  
  
  /**
   * memberno로 회원 조회
   * @param memberno
   */
  public MemberVO read(int memberno);
  
  /**
   * id로 회원 조회
   * @param id
   * @return
   */
  public MemberVO readByid(String id);
  
  /**
   * 회원 정보 업데이트
   * @param memberVO
   * @return
   */
  public int update(MemberVO memberVO);
  
  /**
   * 회원 정보 삭제
   * @param memberno
   * @return
   */
  public int delete(int memberno);
  
  /**
   * 패스워드 변경
   * @param memberno
   * @return
   */
  public int passwd_update(HashMap<Object, Object> map);
  
  /**
   * 현재 패스워드 검사
   * @param map
   * @return 0: 일치하지 않음, 1: 일치함
   */
  public int passwd_check(HashMap<Object, Object> map);
  
  /**
   * 로그인 처리
   */
  public int login(Map<String, Object> map);
  
  /**
   * id로 회원 정보 조회
   * @param id
   * @return
   */
  public MemberVO readById(String id);
  
  /**
   *  id찾기 전 개인정보 검사
   * @param map
   * @return
   */
  public int id_personal_check(HashMap<Object, Object> map);
  
  /**
   * id찾기 전 memberno 추출
   * @param map
   * @return
   */
  public int id_memberno_check(HashMap<Object, Object> map);
  
  /**
   * ID 찾기
   * @param memberno
   * @return
   */
  public String id_find(int memberno);
  
  /**
   *  passwd찾기 전 개인정보 검사
   * @param map
   * @return
   */
  public int passwd_personal_check(HashMap<Object, Object> map);
  
  /**
   * passwd찾기 전 memberno 추출
   * @param map
   * @return
   */
  public int passwd_memberno_check(HashMap<Object, Object> map);

  /**
   * passwd 찾기
   * @param memberno
   * @return
   */
  public String passwd_find(int memberno);
  
  /**
   * 회원 탈퇴
   * @param map
   * @return
   */
  public int grade_update(HashMap<Object, Object> map);

  

}
