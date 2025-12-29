import 'package:flutter/material.dart';
import '../../models/grocery.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem> {
  // Default settings
  static const defautName = "New grocery";
  static const defaultQuantity = 1;
  static const defaultCategory = GroceryCategory.fruit;

  final _formKey = GlobalKey<FormState>();

  // Inputs
  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();
  GroceryCategory _selectedCategory = defaultCategory;

  @override
  void initState() {
    super.initState();
    // Initialize intputs with default settings
    _nameController.text = defautName;
    _quantityController.text = defaultQuantity.toString();
  }

  @override
  void dispose() {
    super.dispose();

    // Dispose the controlers
    _nameController.dispose();
    _quantityController.dispose();
  }

  void onReset() {
    // Will be implemented later - Reset all fields to the initial values
    _nameController.text = defautName;
    _quantityController.text = defaultQuantity.toString();
    setState(() {
      _selectedCategory = defaultCategory;
    });
  }

  void onAdd() {
    // Will be implemented later - Create and return the new grocery
    if (_formKey.currentState!.validate()) {
      Grocery newItem = Grocery(
        id: 'D',
        name: _nameController.text,
        quantity: int.parse(_quantityController.text),
        category: _selectedCategory,
      );
      Navigator.pop(context, newItem);
    }
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'The name need to be fill';
    }
    if (value.length < 5 || value.length > 50) {
      return 'The name must be between 5 to 50 characters';
    }
    return null;
  }

  String? validateQuantity(String? value){
    int number = int.tryParse(value!) ?? 0 ;
    if (value.isEmpty){
      return 'The Quantity should be fill';
    }
    if (number < 0 ){
      return 'Hello';
    }
    return null;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add a new item')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: validateName,
                controller: _nameController,
                maxLength: 50,
                decoration: const InputDecoration(label: Text('Name')),
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      validator: validateQuantity,
                      controller: _quantityController,
                      decoration: const InputDecoration(
                        label: Text('Quantity'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField<GroceryCategory>(
                      initialValue: _selectedCategory,
                      items: GroceryCategory.values.map((item) {
                        return DropdownMenuItem<GroceryCategory>(
                          value: item,
                          child: Row(
                            children: [
                              Container(
                                color: item.color,
                                width: 15,
                                height: 15,
                              ),
                              SizedBox(width: 8),
                              Text(item.label),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            _selectedCategory = value;
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: onReset, child: const Text('Reset')),
                  ElevatedButton(
                    onPressed: onAdd,
                    child: const Text('Add Item'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
