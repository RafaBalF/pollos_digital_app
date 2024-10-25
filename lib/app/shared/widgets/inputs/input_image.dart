import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/enums/input_image_types.enum.dart';
import 'package:pollos_digital/app/shared/text_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InputImagemWidget extends StatefulWidget {
  XFile? image;
  String? linkImage;
  InputImageType? inputType;
  ValueNotifier<XFile?>? arquivoNotifier;

  InputImagemWidget({
    super.key,
    this.inputType,
    this.image,
    this.linkImage,
    this.arquivoNotifier,
  });

  factory InputImagemWidget.circle({
    XFile? image,
    String? linkImage,
    InputImageType? inputType,
    ValueNotifier<XFile?>? arquivoNotifier,
  }) =>
      InputImagemWidget(
        image: image,
        linkImage: linkImage,
        inputType: InputImageType.circle,
        arquivoNotifier: arquivoNotifier,
      );

  factory InputImagemWidget.rectangular({
    XFile? image,
    String? linkImage,
    final Function()? deleteFile,
    final Function(XFile i)? addFile,
    InputImageType? inputType,
    ValueNotifier<XFile?>? arquivoNotifier,
  }) =>
      InputImagemWidget(
        image: image,
        linkImage: linkImage,
        inputType: InputImageType.rectangular,
        arquivoNotifier: arquivoNotifier,
      );

  @override
  State<InputImagemWidget> createState() => _InputImagemWidgetState();
}

class _InputImagemWidgetState extends State<InputImagemWidget> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ValueListenableBuilder<XFile?>(
        valueListenable: widget.arquivoNotifier!,
        builder: (context, valor, child) {
          return _selectTypeInputImage();
        },
      );
    });
  }

  _selectTypeInputImage() {
    switch (widget.inputType) {
      case InputImageType.circle:
        return _circle();
      case InputImageType.rectangular:
        return _rectangular();
      default:
        return _InputImagemWidgetState();
    }
  }

  Widget _circle() {
    return (widget.image == null && widget.linkImage == null)
        ? _addFileWidgetCircle()
        : _fileCardCircle(widget.linkImage);
  }

  Widget _rectangular() {
    return (widget.image == null && widget.linkImage == null)
        ? _addFileWidgetRectangular()
        : _fileCardRectangular(widget.linkImage);
  }

  Widget _fileCardCircle(imagemLink) {
    return Container(
      // width: 300,
      // height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Stack(
        children: [
          Positioned(
              child: CircleAvatar(
            radius: 48.w / 2,
            // borderRadius: const BorderRadius.all(Radius.circular(10)),
            backgroundImage: _imageCircle(imagemLink),
          )),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: focus,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    widget.image = null;
                    widget.linkImage = null;
                    setState(() {});
                  }),
            ),
          )
        ],
      ),
    );
  }

  Widget _fileCardRectangular(imagemLink) {
    return Container(
        width: 100.w,
        height: 40.h,
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Stack(
          children: [
            Positioned.fill(
                child: Padding(
              padding: EdgeInsets.all(5.w),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: _imageRectangular(imagemLink),
              ),
            )),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: focus,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      widget.image = null;
                      widget.linkImage = null;
                      setState(() {});
                    }),
              ),
            )
          ],
        ));
  }

  ImageProvider<Object>? _imageCircle(imagemLink) {
    return imagemLink == null
        ? FileImage(
            File(widget.image!.path),
            // fit: BoxFit.cover,
          )
        : NetworkImage(imagemLink);
  }

  Widget _imageRectangular(imagemLink) {
    return imagemLink == null
        ? Image.file(
            File(widget.image!.path),
            fit: BoxFit.cover,
          )
        : Image.network(imagemLink);
  }

  Widget _addFileWidgetCircle() {
    return GestureDetector(
      onTap: () async {
        await _getGalleryPhoto(context);
      },
      child: Container(
        width: 58.w,
        height: 30.h,
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
            border: Border.all(style: BorderStyle.solid, color: focus),
            // borderRadius: BorderRadius.circular(10000),
            shape: BoxShape.circle),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.camera_alt_outlined,
                color: focus,
                size: 35.sp,
              ),
              DividerWidget(height: 2.h),
              textWidget('Incluir Imagem',
                  color: focus, fontSize: 18.sp, fontWeight: FontWeight.bold),
            ],
          ),
        ),
      ),
    );
  }

  Widget _addFileWidgetRectangular() {
    return GestureDetector(
      onTap: () async {
        await _getGalleryPhoto(context);
      },
      child: Container(
        width: 90.w,
        height: 30.h,
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
            border: Border.all(style: BorderStyle.solid, color: focus),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.camera_alt_outlined,
                color: focus,
                size: 35.sp,
              ),
              DividerWidget(height: 2.h),
              textWidget('Incluir Imagem',
                  color: focus, fontSize: 18.sp, fontWeight: FontWeight.bold),
            ],
          ),
        ),
      ),
    );
  }

  _getGalleryPhoto(context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    // widget.addFile!(image!);
    widget.image = image;
    widget.arquivoNotifier?.value = widget.image!;
    setState(() {});
  }
}
