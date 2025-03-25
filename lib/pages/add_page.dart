import 'dart:io';

import 'package:ecommerce/model/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class AddPage extends StatefulWidget {
  final Product? product;
  const AddPage({super.key, this.product});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 800,
      imageQuality: 85,
    );

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  late final TextEditingController _nameController;
  late final TextEditingController _priceController;
  late final TextEditingController _categoryController;
  late final TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.product?.name ?? '');
    _priceController = TextEditingController(text: widget.product?.price ?? '');
    _categoryController = TextEditingController(
      text: widget.product?.category ?? '',
    );
    _descriptionController = TextEditingController(
      text: widget.product?.description ?? '',
    );
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _priceController.dispose();
    _categoryController.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Row(
                  children: [
                    IconButton(
                      iconSize: 20,
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Transform.translate(
                        offset: Offset(2, 0),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: const Color.fromARGB(255, 63, 81, 243),
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    Text(
                      widget.product != null ? 'Update Product' : 'Add Product',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 100, 98, 98),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              GestureDetector(
                onTap: () => _pickImage(),
                child: Container(
                  height: 190,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 243, 243, 243),
                  ),
                  child:
                      _selectedImage==null && widget.product?.imagePath== null
                          ? Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add_photo_alternate,
                                      size: 50,
                                      color: const Color.fromARGB(
                                        255,
                                        161,
                                        158,
                                        158,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'upload Photo',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: const Color.fromARGB(
                                          255,
                                          161,
                                          158,
                                          158,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                          : ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox.expand(
                              child: _selectedImage!=null ? Image.file(
                                _selectedImage!,
                                fit: BoxFit.cover, 
                              ): Image.asset(widget.product!.imagePath)
                            ),
                          ),
                ),
              ),

              SizedBox(height: 30),

              Text(
                'name',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: 10),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 243, 243, 243),
                ),
                child: TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ),

              SizedBox(height: 20),
              Text(
                'category',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: 10),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 243, 243, 243),
                ),
                child: TextField(
                  controller: _categoryController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ),

              SizedBox(height: 10),
              Text(
                'price',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: 10),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 243, 243, 243),
                ),
                child: TextField(
                  controller: _priceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(16),
                    suffixIcon: Icon(
                      Icons.attach_money,
                      color: Color.fromARGB(255, 126, 124, 124),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),
              Text(
                'description',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: 10),
              Container(
                height: 144,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 243, 243, 243),
                ),
                child: TextField(
                  maxLines: 5,
                  minLines: 1,
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Column(
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 63, 81, 243),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Add',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.red),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Delete',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                        ),
                      ),
                    ),
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
