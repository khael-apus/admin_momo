import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Inputlistconsumer extends StatefulWidget {
  const Inputlistconsumer({super.key});

  @override
  State<Inputlistconsumer> createState() => _InputlistconsumerState();
}

class _InputlistconsumerState extends State<Inputlistconsumer> {
  final _titleController = TextEditingController();
  final _dateController = TextEditingController();
  final _itemNameController = TextEditingController();
  final _itemDescriptionController = TextEditingController();
  final _itemVolumeController = TextEditingController();
  final _itemWeightController = TextEditingController();
  final _itemQuantityController = TextEditingController();
  final _itemSpecialInstructionsController = TextEditingController();

  List<Map<String, dynamic>> _items = []; // Use dynamic to store images
  Map<String, XFile?> _itemImages = {}; // Store images for each item

  bool _isTitleEditable = false;
  bool _isEditing = false; // Flag for editing mode
  int? _editingIndex; // To track which item is being edited

  @override
  void dispose() {
    _titleController.dispose();
    _dateController.dispose();
    _itemNameController.dispose();
    _itemDescriptionController.dispose();
    _itemVolumeController.dispose();
    _itemWeightController.dispose();
    _itemQuantityController.dispose();
    _itemSpecialInstructionsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Image.asset('Momo_images/back.png'),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: IconButton(
            icon: Image.asset('Momo_images/Check icon.png'),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Save Your List'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            labelText: ' List Title ',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                            labelText: '',
                            border: OutlineInputBorder(),
                          ),
                          items: [
                            DropdownMenuItem(child: Text('Unclassified')),
                          ],
                          onChanged: (value) {},
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancel'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Save'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, '/orderlistrequestconsumer');
                              },
                              child: Text('Save & Order'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(),
          _buildDate(),
          const SizedBox(height: 6.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildAddItemButton(),
              _buildEditButton(),
            ],
          ),
          const SizedBox(height: 16.0),
          _buildImage(),
          const SizedBox(height: 20),
          _items.isNotEmpty ? _buildItemsList() : _buildNoItemsText(),
          const SizedBox(height: 150), // Added extra padding
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isTitleEditable = !_isTitleEditable;
          });
        },
        child: AbsorbPointer(
          absorbing: !_isTitleEditable,
          child: TextField(
            controller: _titleController,
            readOnly: !_isTitleEditable,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Input title',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDate() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: () async {
          final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
          );
          if (picked != null) {
            setState(() {
              _dateController.text = picked.toString().split(' ').first;
            });
          }
        },
        child: AbsorbPointer(
          child: TextField(
            controller: _dateController,
            readOnly: true,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Date',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAddItemButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 223, 236, 224),
          textStyle: const TextStyle(fontSize: 20, color: Colors.white),
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19),
          ),
        ),
        onPressed: () {
          _showAddOrEditItemDialog();
        },
        child: const Text('Add Item'),
      ),
    );
  }

  Widget _buildEditButton() {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton(
        onPressed: () {
          setState(() {
            _isEditing = !_isEditing;
          });
        },
        child: Text(
          _isEditing ? 'Save' : 'Edit',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Center(
      child: Image.asset('Momo_images/find.png'),
    );
  }

  Widget _buildNoItemsText() {
    return Center(
      child: Text(
        _items.isEmpty ? "No items on this list yet." : '',
        style: const TextStyle(
          fontSize: 15,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }

  Widget _buildItemsList() {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Added padding around the list
      child: Column(
        children: _items.asMap().entries.map((entry) {
          int index = entry.key;
          Map<String, dynamic> item = entry.value;
          return Column(
            children: [
              OrderCard(
                orderName: item["name"] ?? '',
                description: item["description"] ?? '',
                weight: item["weight"] ?? '',
                volume: item["volume"] ?? '',
                item: item["quantity"] ?? '',
                specialInstructions: item["specialInstructions"] ?? '',
                imagePicker: _itemImages[item["name"]] != null
                    ? _itemImages[item["name"]]!.path
                    : '',
                onTap: () {
                  _showAddOrEditItemDialog(editIndex: index);
                },
              ),
              if (_isEditing)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        _showAddOrEditItemDialog(editIndex: index);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          _items.removeAt(index);
                          _itemImages.remove(item["name"]);
                        });
                      },
                    ),
                  ],
                ),
            ],
          );
        }).toList(),
      ),
    );
  }

  void _showAddOrEditItemDialog({int? editIndex}) {
    if (editIndex != null) {
      // If editing, populate fields with current values
      final item = _items[editIndex];
      _itemNameController.text = item["name"];
      _itemDescriptionController.text = item["description"];
      _itemVolumeController.text = item["volume"];
      _itemWeightController.text = item["weight"];
      _itemQuantityController.text = item["quantity"];
      _itemSpecialInstructionsController.text = item["specialInstructions"];
    } else {
      _itemNameController.clear();
      _itemDescriptionController.clear();
      _itemVolumeController.clear();
      _itemWeightController.clear();
      _itemQuantityController.clear();
      _itemSpecialInstructionsController.clear();
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: const EdgeInsets.only(left: 30, right: 30),
        title: const Text('Add/Edit an item'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              _buildTextField("Name:", _itemNameController),
              const SizedBox(height: 10),
              _buildTextField("Description:", _itemDescriptionController),
              const SizedBox(height: 10),
              _buildTextField("Volume:", _itemVolumeController),
              const SizedBox(height: 10),
              _buildTextField("Weight:", _itemWeightController),
              const SizedBox(height: 10),
              _buildTextField("Quantity:", _itemQuantityController),
              const SizedBox(height: 10),
              _buildTextField(
                "Special Instructions:",
                _itemSpecialInstructionsController,
              ),
              const SizedBox(height: 10),
              _buildAddPictureButton(),
              const SizedBox(height: 10),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              _addOrEditItem(editIndex: editIndex);
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _addOrEditItem({int? editIndex}) {
    final item = {
      "name": _itemNameController.text,
      "description": _itemDescriptionController.text,
      "volume": _itemVolumeController.text,
      "weight": _itemWeightController.text,
      "quantity": _itemQuantityController.text,
      "specialInstructions": _itemSpecialInstructionsController.text,
    };

    if (editIndex != null) {
      // Edit existing item
      setState(() {
        _items[editIndex] = item;
      });
    } else {
      // Add new item
      setState(() {
        _items.add(item);
      });
    }
  }

  Widget _buildAddPictureButton() {
    return ElevatedButton(
      onPressed: _pickImage,
      child: const Text("Add Picture"),
    );
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _itemImages[_itemNameController.text] = pickedImage;
      });
    }
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }

  void _saveChanges() {
    setState(() {
      _isEditing = false;
    });
  }
}

class OrderCard extends StatelessWidget {
  final String orderName;
  final String description;
  final String weight;
  final String volume;
  final String item;
  final String specialInstructions;
  final String imagePicker;
  final VoidCallback onTap;

  const OrderCard({
    required this.orderName,
    required this.description,
    required this.weight,
    required this.volume,
    required this.item,
    required this.specialInstructions,
    required this.imagePicker,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: ListTile(
          title: Text(orderName),
          subtitle: Text(description),
          trailing: Image.asset(imagePicker),
        ),
      ),
    );
  }
}
