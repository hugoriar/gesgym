<tr class=${clase} >
    <td style="text-align: right; font-weight: bold;">${titulo}</td>
    <td>${cantidad?"":"\$"}</td><td style="text-align: right; border-left: none;">${String.format("%,d", pagoMapSuma1?:0)}</td>
    <td>${cantidad?"":"\$"}</td><td style="text-align: right; border-left: none;">${String.format("%,d", pagoMapSuma2?:0)}</td>
    <td style="text-align: center; color: ${pagoMapSuma<0?"red":"limegreen"};">
        ${((pagoMapSuma>0)?"+":(pagoMapSuma<0?"- ":""))+String.format((cantidad?"":"\$")+"%,d", Math.abs(pagoMapSuma))}
        <i class="${pagoMapSuma<0?"icon-arrow-down":(pagoMapSuma>0?"icon-arrow-up":"")}" style="color:${pagoMapSuma<0?"red":"limegreen"};"></i>${(pagoMapSuma<0) ? (new Float(100 - ((100*pagoMapSuma1)/(pagoMapSuma2?:1))).round(2)) : (new Float(((100*pagoMapSuma1)/(pagoMapSuma2?:1))-100).round(2))}%
    </td>
</tr>