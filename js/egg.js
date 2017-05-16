
	
		function testName(id){
			var testNamePattern = /index/i;
			var nameValue = document.getElementById(id).value;
			if (testNamePattern.test(nameValue))
				return true;
		}
		
		//Warning for invalid name format
		function warnTestName(id){
		       if (!testName(id)) {
			    document.getElementById('itemname').className='error';
				document.getElementById('errorname').innerHTML="Wrong answer";
		        return false;
				} else {
				document.getElementById('itemname').className='';
				document.getElementById('errorname').innerHTML="";
				return true;
		}
		}
		
		function testName_1(id){
			var testNamePattern_1 = /footer/;
			var nameValue_1 = document.getElementById(id).value;
			if (testNamePattern_1.test(nameValue_1))
				return true;
		}
		
		//Warning for invalid name format
		function warnTestName_1(id){
		       if (!testName_1(id)) {
			    document.getElementById('itemname').className='error';
				document.getElementById('errorname').innerHTML="Wrong answer";
		        return false;
				} else {
				document.getElementById('itemname').className='';
				document.getElementById('errorname').innerHTML="";
				return true;
		}
		}
		
		function testName_2(id){
			var testNamePattern_2 = /4/;
			var nameValue_2 = document.getElementById(id).value;
			if (testNamePattern_2.test(nameValue_2))
				return true;
		}
		
		//Warning for invalid name format
		function warnTestName_2(id){
		       if (!testName_2(id)) {
			    document.getElementById('itemname').className='error';
				document.getElementById('errorname').innerHTML="Wrong answer";
		        return false;
				} else {
				document.getElementById('itemname').className='';
				document.getElementById('errorname').innerHTML="";
				return true;
		}
		}
		
		function testName_3(id){
			var testNamePattern_3 = /button/;
			var nameValue_3 = document.getElementById(id).value;
			if (testNamePattern_3.test(nameValue_3))
				return true;
		}
		
		//Warning for invalid name format
		function warnTestName_3(id){
		       if (!testName_3(id)) {
			    document.getElementById('itemname').className='error';
				document.getElementById('errorname').innerHTML="Wrong answer";
		        return false;
				} else {
				document.getElementById('itemname').className='';
				document.getElementById('errorname').innerHTML="";
				return true;
		}
		}
		
		function testName_4(id){
			var testNamePattern_4 = /pointer/;
			var nameValue_4 = document.getElementById(id).value;
			if (testNamePattern_4.test(nameValue_4))
				return true;
		}
		
		//Warning for invalid name format
		function warnTestName_4(id){
		       if (!testName_4(id)) {
			    document.getElementById('itemname').className='error';
				document.getElementById('errorname').innerHTML="Wrong answer";
		        return false;
				} else {
				document.getElementById('itemname').className='';
				document.getElementById('errorname').innerHTML="";
				return true;
		}
		}
		
		function formValidate(){
	
         if(warnTestName('InputName1')&warnTestName_1('InputName2')& warnTestName_2('InputName3')&
		     testName_3('InputName4')&warnTestName_4('InputName5'))
		 {
		 return true;
		 } else {
		 return false;
        }
         }		
