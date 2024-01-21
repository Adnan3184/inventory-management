import 'dart:io';

void main() {
  // Create an empty list to store inventory items
  List<String> inventory = [];

  while (true) {
    // Display menu options
    print('Choose an option:');
    print('1. Add Item to Inventory');
    print('2. View Inventory');
    print('3. Remove Item from Inventory');
    print('4. Exit');

    // Get user input for menu choice
    var choice = int.tryParse(stdin.readLineSync() ?? '');

    // Process user choice using a switch statement
    switch (choice) {
      case 1:
        addItem(inventory);
        break;
      case 2:
        viewInventory(inventory);
        break;
      case 3:
        removeItem(inventory);
        break;
      case 4:
        exit(0); // Exit the program
        break;
      default:
        print('Invalid option. Please choose again.');
    }
  }
}

// Function to add an item to the inventory
void addItem(List<String> inventory) {
  // Get user input for the item to add
  print('Enter the name of the item to add:');
  var item = stdin.readLineSync();

  // Add the item to the inventory list
  inventory.add(item ?? '');
  print('Item added to the inventory!');
}

// Function to view the inventory
void viewInventory(List<String> inventory) {
  // Check if the inventory is empty
  if (inventory.isEmpty) {
    print('Inventory is empty.');
  } else {
    // Display the items in the inventory with their indices
    print('Inventory:');
    for (var i = 0; i < inventory.length; i++) {
      print('${i + 1}: ${inventory[i]}');
    }
  }
}

// Function to remove an item from the inventory
void removeItem(List<String> inventory) {
  // Display the current inventory
  viewInventory(inventory);

  // Check if the inventory is empty
  if (inventory.isEmpty) {
    return;
  }

  // Get user input for the item number to remove
  print('Enter the number of the item to remove:');
  var itemNumber = int.tryParse(stdin.readLineSync() ?? '');

  // Check if the entered item number is valid
  if (itemNumber != null && itemNumber >= 1 && itemNumber <= inventory.length) {
    // Remove the item and inform the user
    var removedItem = inventory.removeAt(itemNumber - 1);
    print('$removedItem removed from the inventory.');
  } else {
    print('Invalid item number. No item removed.');
  }
}
