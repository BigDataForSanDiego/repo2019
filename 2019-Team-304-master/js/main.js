//Essential Global Variable
const price = 5;
var studentNum;
var total = price;
var foodItem;

//This is where I get the information for the date Menu
var n = new Date();
var d = n.getDay() - 1;
var day = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];        
document.getElementById("day").innerHTML = `${day[d]} Menu`;

//Here the menus for each day are created
var mon = ["Pizza", "Chicken Alfredo", "Cheeseburger", "PB&J Sandwich", "Chicken Sandwich"];
var tue = ["BBQ Ribs w/ Rice", "Carnitas Chips", "Orange Chicken", "Taco Salad", "Chicken Sandwich"];
var wed = ["Pork Enchiladas", "Ham/Cheese Sandwich", "Cheesy Garlic Bread w/ Marinera Sauce", "Protein Bistro", "Chicken Sandwich"];
var thu = ["Pork Rice Bowl", "Chicken/Ceasar Salad", "Bosco Stick w/ Marinera Sauce", "Tasty Tamale", "Chicken Sandwich"];
var fri = ["Fish Sandwich", "Pizza", "Beef Nachos", "Chicken Greek Salad", "Chicken Sandwich"];

//Here I will display the menu in webpage depending on what day it is
var index = 0;
var num = 1;
if (day[d] == "Monday") {
    for (var item in mon) {
        document.getElementById("food"+num).innerHTML = mon[index];
        index++;
        num++;
    }
}
else if (day[d] == "Tuesday") {
    for (var item in tue) {
        document.getElementById("food"+num).innerHTML = tue[index];
        index++;
        num++;
    }
}
else if (day[d] == "Wednesday") {
    for (var item in wed) {
        document.getElementById("food"+num).innerHTML = wed[index];
        index++;
        num++;
    }
}
else if (day[d] == "Thursday") {
    for (var item in thu) {
        document.getElementById("food"+num).innerHTML = thu[index];
        index++;
        num++;
    }
}
else if (day[d] == "Friday") {
    for (var item in fri) {
        document.getElementById("food"+num).innerHTML = fri[index];
        index++;
        num++;
    }
}
else {
    document.getElementById(day).innerHTML = "No School"
}

//Here I will display items and cost on rigth side of menu webpage after clicking food buttons
function myFood(button) {
    //In here I create an object in order to know the exact button clicked
    this.buttonNum = button;

    //In here I determine the day and its first three letters in order to use the array and display the food item
    var eDay = day[d];
    var days = eDay.substring(0, 3).toLowerCase();
    if (days == "mon") {
        foodItem = mon[button];
    }
    else if (days == "tue") {
        foodItem = tue[button];
    }
    else if (days == "wed") {
        foodItem = wed[button];
    }
    else if (days == "thu") {
        foodItem = thu[button];
    }
    else if (days == "fri") {
        foodItem = fri[button];
    }
    else {
        alert("No School");
    }

    //In here I will make the item and price visible to user
    document.getElementById("itemAdd").innerHTML = `${foodItem}...............$${price}`; 
    studentNum = Cookies.get('studentNum');
    if (!(studentNum>=1)) {
        Cookies.set('studentNum', 1, {expires: 1});
    }
    studentNum = Cookies.get('studentNum');
    document.getElementById("student").innerHTML = `Student ${studentNum}:`;     

    //In here I will add the prices
    document.getElementById("total").innerHTML = `Total: $${total}`;
}

//These function creates the functionality for the dropdown menu in the food items of webpage 1
function myQuant(value) {
    total = price*value;
    document.getElementById("total").innerHTML = `Total: $${total}`;
}
function myNext() {
    if (foodItem == undefined) {
        alert("No item has been selected");
    }
    else {
        Cookies.set('price', total, { expires: 1 });
        Cookies.set('foodItem', foodItem, { expires: 1 });
        window.location.href = '/order.html';
    }
}