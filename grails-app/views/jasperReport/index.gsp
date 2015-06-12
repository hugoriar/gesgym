<!Doctype HTML>
<html>
<head>
    <title>testapp : jasper report</title>
</head>
<body>
Total record found : ${jasperDTOList.size()}
<g:if test="${jasperDTOList.size() > 0}">
    <table border="1">
        <tr>
            <td>Name</td>
            <td>Age</td>
            <td>Gender</td>
            <td>Address</td>
        </tr>
        <g:each var="jasperDTO" in="${jasperDTOList}">
            <tr>
                <td>${jasperDTO.name}</td>
                <td>${jasperDTO.age}</td>
                <td>${jasperDTO.gender}</td>
                <td>${jasperDTO.address}</td>
            </tr>
        </g:each>
    </table>
    <a href="/control/jasperReport/generateReport?_format=XLS&_name=all_dto&_file=all_dto">
        XLS
    </a>
    |
    <a href="/control/jasperReport/generateReport?_format=PDF&_name=all_dto&_file=all_dto">
        PDF
    </a>

</g:if>
</body>
</html>