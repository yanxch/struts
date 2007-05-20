<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>

<html>
<head>
    <title>Bind Examples</title>
    <jsp:include page="/ajax/commonInclude.jsp"/>
</head>

<script type="text/javascript">
    dojo.event.topic.subscribe("/before", function(data, type, e){
      alert("Before request");
    });
    dojo.event.topic.subscribe("/after", function(data, type, e){
      alert("After request");
    });
</script>

<body>

<div id="div1">Div 1</div>
<s:url id="ajaxTest" value="/AjaxTest.action" />


<br/><br/>
<p>
    1. Attach to "onclick" event on button. Update content of Div 1. Use with indicator.
    <img id="indicator" src="${pageContext.request.contextPath}/images/indicator.gif" alt="Loading..." style="display:none"/>
    <sx:bind id="ex1" href="%{#ajaxTest}" sources="button" targets="div1" events="onclick" indicator="indicator" />
     <br/>
    <s:submit theme="simple" type="submit" value="submit" id="button"/>
</p>
<br/><br/>
<p>
    2. Attach to "onmouseover", and "onclick" event on Area below and update content of Div1, highlight targets with green color
    <sx:bind id="ex2" href="%{#ajaxTest}" sources="div2" targets="div1" events="onmouseover,onclick" highlightColor="green"/>
    <div id="div2" style="width: 300px; height: 50px; border: 1px solid black">
        Mouse Over or Click Here!
    </div>
</p>
<br/><br/>
<p>
    3. Attach to "onchange", event on Checkbox below and update content of Div1 submitting a form.
    <sx:bind id="ex3" href="%{#ajaxTest}" sources="chk1" targets="div1" events="onchange" formId="form1" />
    <form id="form1">
        <s:checkbox name="data" label="Hit me" id="chk1"/>
    </form>
</p>
<br/><br/>
<p>
    4. Attach to "onkeydown" event on Textbox below update content of Div1. Publish topics.
    <sx:bind id="ex4" href="%{#ajaxTest}" sources="txt1" targets="div1" events="onkeydown" beforeNotifyTopics="/before" afterNotifyTopics="/after" />
    <br/>
    <s:textfield id="txt1"/>
</p>


<br/><br/>
<s:include value="../footer.jsp"/>

</body>
</html>