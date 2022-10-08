//In here I will display the price information
var due;
total = Cookies.get("price");
studentNum = Cookies.get("studentNum");
document.getElementById("total2").innerHTML = `Total Price: $${total}`;

//In here I calculate the amount that must given back to the student in payment
function myGiven(form) {
   var given = form.amtGiven.value;
   due = given - total;
   Cookies.set('due', due, {expires: 1});  
}
due = Cookies.get("due");
document.getElementById("dueBack").innerHTML = `Due Back: $${due}`;

//This function is to cancel the order
function myCancel() {
   var answer = confirm("Cancel?")
   if (answer) {
      total = 5;
      Cookies.set("due", "", {expires:1});
      window.location.href = '/';
   }
   else {
      //some code
   }
}

//This sets up the variables after finishing a payment
function myFinish() {
   if (due == "" || due == undefined) {
      alert("Payment has not been processed.")
   } else {
      foodItem = Cookies.get("foodItem");
      var info = {
         "studentNum": studentNum,
         "foodItem" : foodItem,
         "price": total
      }
      var data = JSON.stringify(info);
      console.log(data);
      alert();
      total = 5;
      studentNum++;
      Cookies.set('studentNum', studentNum, {expires: 1});
      Cookies.set("due", "", {expires: 1});
      window.location.href = '/';
   }
}
