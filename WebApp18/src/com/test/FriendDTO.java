package com.test;

public class FriendDTO
{
	// 주요 속성 구성
	private String name;		//-- 이름
	private String age;			//-- 나이			연산이 필요한 상황이면 int로 구성해도 됨!
	private String gender;		//-- 성별
	//private String idelType;	//-- 이상형 -- check~!!!
	private String[] idelType;	// 체크 박스 → 다중 선택 가능하기 때문에 → 배열로 구성 check~!!		다중선택 안하게 한다면 배열로 구성할 필요없다!
	//-- 이상형은 여러 개의 데이터가 동시에 전달되므로
	//   (즉, 다중 선택이 가능하도록 구성하였기 때문에)
	//   배열로 처리한다.
	
	
	// getter / setter
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getAge()
	{
		return age;
	}
	public void setAge(String age)
	{
		this.age = age;
	}
	public String getGender()
	{
		return gender;
	}
	public void setGender(String gender)
	{
		this.gender = gender;
	}
	/*
	public String getIdelType()
	{
		return idelType;
	}
	public void setIdelType(String idelType)
	{
		this.idelType = idelType;
	}
	*/
	public String[] getIdelType()
	{
		return idelType;
	}
	public void setIdelType(String[] idelType)
	{
		this.idelType = idelType;
	}
	
	
	
}
