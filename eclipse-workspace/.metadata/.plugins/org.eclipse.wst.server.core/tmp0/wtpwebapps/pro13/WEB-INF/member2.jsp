<%@page import="sec01.ex01.MemberBean"%>
<%@page import="java.util.List"%>
<%@page import="sec01.ex01.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="m" class="sec01.ex01.MemberBean" scope="page"></jsp:useBean>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String email = request.getParameter("email");

	m.setId(id);
	m.setPwd(pwd);
	m.setName(name);
	m.setEmail(email);

	MemberDAO memberDAO = new MemberDAO();
	memberDAO.addMember(m);
	List membersList = memberDAO.listMembers();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�����â</title>
</head>
<body>
	<table align="center" width="100%">
		<tr align="center" bgcolor="#99ccff">
			<td width="7%">���̵�</td>
			<td width="7%">��й�ȣ</td>
			<td width="5%">�̸�</td>
			<td width="11%">�̸���</td>
			<td width="5%">������</td>
		</tr>
		<%
			if (membersList.size() == 0) {
		%>
		<tr>
			<td colspan="5">
				<p align="center">
					<b><span style="font-size: 9pt;"> ��ϵ� ȸ���� �����ϴ�.</span></b>
				</p>
			</td>
		</tr>
		<%
			} else {
				for (int i = 0; i < membersList.size(); i++) {
					MemberBean bean = (MemberBean) membersList.get(i);
		%>
		<tr align="center">
			<td><%=bean.getId()%></td>
			<td><%=bean.getPwd()%></td>
			<td><%=bean.getName()%></td>
			<td><%=bean.getEmail()%></td>
			<td><%=bean.getJoinDate()%></td>
		</tr>
		<%
			} // end for

			} // end if
		%>
		<tr height="1" bgcolor="#99ccff">
			<td colspan="5"></td>
		</tr>

	</table>

</body>
</html>

