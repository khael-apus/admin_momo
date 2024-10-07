import 'package:flutter/material.dart';

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

  List<Map<String, String>> _items = [];

  bool _isTitleEditable = false;

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
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
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
          const SizedBox(height: 32),
          _buildImage(),
          const SizedBox(height: 150),
          _buildNoItemsText(),
          _buildItemsList(),
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
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              contentPadding:
                  const EdgeInsets.only(left: 30, right: 30), // Add this line
              title: const Text(
                  '             Add an item to your list.                    '),
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
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _items.add({
                        "name": _itemNameController.text,
                        "description": _itemDescriptionController.text,
                        "volume": _itemVolumeController.text,
                        "weight": _itemWeightController.text,
                        "quantity": _itemQuantityController.text,
                        "specialInstructions":
                            _itemSpecialInstructionsController.text,
                      });
                    });
                    _itemNameController.clear();
                    _itemDescriptionController.clear();
                    _itemVolumeController.clear();
                    _itemWeightController.clear();
                    _itemQuantityController.clear();
                    _itemSpecialInstructionsController.clear();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          );
        },
        child: const Text('     Add Item'),
      ),
    );
  }

  Widget _buildEditButton() {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'Edit          ',
          style: TextStyle(
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
    return Column(
      children: _items.map((item) {
        return ListTile(
          title: Text(item["name"] ?? ""),
          subtitle: Text(item["description"] ?? ""),
        );
      }).toList(),
    );
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

  Widget _buildAddPictureButton() {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Add a picture'),
    );
  }
}
