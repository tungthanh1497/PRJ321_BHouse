<%-- 
    Document   : CustomerJSP
    Created on : Oct 30, 2017, 10:29:43 PM
    Author     : tungthanh.1497
--%>

<%@page import="enities.Notification"%>
<%@page import="enities.Notification"%>
<%@page import="enities.LoginTBL"%>
<%@page import="enities.ExtraTBL"%>
<%@page import="enities.Roommates"%>
<%@page import="enities.BillTBL"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="enities.RoomContent"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        a:visited{
            color: blue;
        }
        a:hover{
            color: activecaption;
            text-decoration: white;
        }
        body{
            background: gainsboro;
        }
    </style>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 style="color: cornflowerblue">Welcome to Boarding House</h1>
        <u><a href="HandleUser?build=false">Information</a></u> &nbsp;
        <u><a href="HandleUser?build=true">View Bill</a></u> &nbsp;
        <u><a href="HandleUser?build=notify">Notification</a></u> &nbsp;
        <u><a href="HandleUser?build=changePWS">Change Password</a></u>&nbsp;
        <u><a href="HandleUser?build=signOut">Sign Out</a></u>&nbsp;
            <%
                //display default information of user
                RoomContent room = (RoomContent) request.getAttribute("roomContent");
                if (room instanceof RoomContent && room != null) {
            %>
        <h1 style="color: blue">Information of your room </h1   >
        <table >
            <tr>
                <td>Customer Name :</td>
                <td><%=room.getCusName()%></td>
            </tr>
            <tr>
                <td>Identify Card :</td>
                <td><%=room.getIdentityCard()%></td>
            </tr>
            <tr>
                <td>Phone Number : </td>
                <td><%=room.getPhoneNum()%></td>
            </tr>
            <tr>
                <td>Parents Phone : </td>
                <td><%=room.getParentPhoneNum()%></td>
            </tr>
            <tr>
                <td>Date Join :</td>
                <td><%=room.getDateJoin()%></td>
            </tr>
            <tr>
                <td>Room Number :</td>
                <td><%=room.getRoomNum()%></td>
            </tr>
            <tr>
                <td>Price of room :</td>
                <td> <%=room.getPrice()%></td>
            </tr>
            <tr>
                <td>Type of room :</td>
                <td><%=room.getNote()%></td>
            </tr>
        </tr>
        <tr>
            <td>Current number person in room  :</td>
            <td> <%=room.getNumPerson()%></td>
        </tr>
    </table>

    <%
        ArrayList<Roommates> arrRoomMate = (ArrayList<Roommates>) request.getAttribute("arrRoomMate");
        if (arrRoomMate instanceof ArrayList && arrRoomMate != null) {
    %> <h1 style="color: blue"> Information of Roommates </h1><%
        for (int i = 0; i < arrRoomMate.size(); i++) {
    %>
    Roommate <%=i + 1%> name : <%= arrRoomMate.get(i).getName()%><br>
    Roommate <%=i + 1%> phone number : <%= arrRoomMate.get(i).getPhoneNum()%><br>
    Roommate <%=i + 1%> date join to room : <%= arrRoomMate.get(i).getJoinDate()%><br>
    <%                }
        }
    %>
    <%}%>
    <%
        //        display page build
        SimpleDateFormat sdf = new SimpleDateFormat("MM/YYYY");
        SimpleDateFormat defaultDate = new SimpleDateFormat("MM/dd/YYYY");
        ArrayList<BillTBL> arrBill = new ArrayList<BillTBL>();
        arrBill = (ArrayList<BillTBL>) request.getAttribute("arrBill");
        if (arrBill instanceof ArrayList && arrBill != null) {
    %>
    <h1 style="color: blue">Information of Bill</h1>
    <table border="1">
        <thead>
            <tr>
                <th>Number Person</th>
                <th>Default Fee</th>
                <th>Electricity</th>
                <th>Extra Fee</th>
                <th>Month Bill</th>
            </tr>
        </thead>
        <%
            for (int i = 0; i < arrBill.size(); i++) {
                int reverse = arrBill.size() - i - 1;
        %>
        <tbody>
            <tr>
                <td><%=arrBill.get(reverse).getNumPer()%></td>
                <td><%=arrBill.get(reverse).getDefaultFee()%></td>
                <td><%=arrBill.get(reverse).getElectricity()%></td>
                <%
                    if (arrBill.get(reverse).getExtraFee() == 0) {
                %>
                <td><%=arrBill.get(reverse).getExtraFee()%></td>
                <%
                } else {
                %>
                <td><a href="HandleUser?build=extra&roomNum=<%=arrBill.get(reverse).getRoomNumber()%>&month=<%=defaultDate.format(arrBill.get(reverse).getMonthBill())%>">
                        <%=arrBill.get(reverse).getExtraFee()%></a>
                </td>
                <%
                    }
                %>              
                <td><%=sdf.format((arrBill.get(reverse).getMonthBill()))%></td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>
    <%
        //display extra bill by click detail extra bill
        SimpleDateFormat sdfExtra = new SimpleDateFormat("dd/MM/YYYY");
        ArrayList<ExtraTBL> arrExtra = new ArrayList<ExtraTBL>();
        arrExtra = (ArrayList<ExtraTBL>) request.getAttribute("arrExtra");
        if (arrExtra instanceof ArrayList && arrExtra != null) {
    %>
    <h1 style="color: blue">View detail extra bill </h1>
    <table border="1">
        <thead>
            <tr>
                <th>Extra Name</th>
                <th>Extra Number</th>
                <th>Price</th>
                <th>Detail</th>
                <th>Extra Date</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (int i = 0; i < arrExtra.size(); i++) {
            %>
            <tr>
                <td><%=arrExtra.get(i).getExtraName()%></td>
                <td><%=arrExtra.get(i).getExtraNumber()%></td>
                <td><%=arrExtra.get(i).getPrice()%></td>
                <td><%=arrExtra.get(i).getDetail()%></td>
                <td><%=sdfExtra.format(arrExtra.get(i).getExtraDate())%></td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>

    <%
        //display interface to user change password
        LoginTBL acc = (LoginTBL) request.getAttribute("account");
        if (acc instanceof LoginTBL && acc != null) {
    %>
    <form action="HandleUser">
        <h1 style="color: blue">Change password</h1>
        <table border="0">
            <tbody>
                <tr>
                    <td> Account :</td>
                    <td><input type="text" name="account" value="<%=acc.getUname()%>" readonly="readonly" /></td>
                </tr>
                <tr>
                    <td>Old Password :</td>
                    <td><input type="password" name="oldPass" value=""/></td>
                </tr>
                <tr>
                    <td>New Password :</td>
                    <td><input type="password" name="newPass" value="" /></td>
                </tr>
                <tr>
                    <td>Re enter password :</td>
                    <td><input type="password" name="reNewPass" value="" /></td>
                </tr>
            </tbody>
        </table>
        <input type="hidden" name="customerID" value="<%=acc.getCustomerID()%>" />
        <input type="submit" value="Confirm" name="build" />   
        <h1 style="color: red">${unsuccess}</h1>
        <h1 style="color: green">${success}</h1>
        <h1 style="color: red">${oldPassWord}</h1>
        <h1 style="color: red">${newPassWord}</h1>
        <h1 style="color: red">${reNewPassWord}</h1>
    </form>
    <%
        }
    %>

    <%
        //display notification for user
        ArrayList<Notification> arrNoti = new ArrayList<Notification>();
        arrNoti = (ArrayList<Notification>) request.getAttribute("arrNoti");
        if (arrNoti instanceof ArrayList && arrNoti != null) {
            if (arrNoti.size() == 0) {
    %>
    <h1 style="color: blue">There are no notifications</h1>
    <%
    } else {
    %>
    <h1 style="background: blue">News</h1>
    <%
        for (int i = 0; i < arrNoti.size(); i++) {
            int reverse = arrNoti.size() - i - 1;
    %>
    *<%=defaultDate.format(arrNoti.get(i).getDateCreated())%> - 
    <a href="HandleUser?build=notify&location=<%=reverse%>"><%=arrNoti.get(reverse).getTitle()%></a>
    <%
                }
            }
        }
    %>
    <%
        //display detail notification
        Notification detailNoti = (Notification) request.getAttribute("detailNoti");
        if (detailNoti instanceof Notification && detailNoti != null) {
    %>
    <h1 style="background: blue">News</h1>
    <h3>Title : <%=detailNoti.getTitle()%></h3>
    <h3>Detail : <%=detailNoti.getDetail()%></h3>
    <h5>Date : <%=defaultDate.format(detailNoti.getDateCreated())%></h5>
    <%
        }
    %>

</body>
</html>
