import 'package:flutter/material.dart';
import 'package:myapp/models/yupiterfilm.dart';
import 'package:myapp/resources/dimentions.dart';
import 'package:nanoid2/nanoid2.dart';

import '../models/moment.dart';
import '../resources/colors.dart';

class MomentCreatePage extends StatefulWidget {
  const MomentCreatePage({super.key, required this.onSaved});

  final Function(Moment newMoment) onSaved;

  @override
  State<MomentCreatePage> createState() => _MomentCreatePageState();
}

class _MomentCreatePageState extends State<MomentCreatePage> {
  // Membuat object form global key
  final _formKey = GlobalKey<FormState>();
  final _dataMoment = {};
  final _dataYupiter ={};

  // Membuat method untuk menyimpan data moment
  void _saveMoment() {
    if (_formKey.currentState!.validate()) {
      // Menyimpan data inputan pengguna ke map _dataMoment
      _formKey.currentState!.save();
      // Membuat object moment baru
      final moment = Moment(
        id: nanoid(),
        momentDate: _dataMoment['momentDate'],
        creator: _dataMoment['creator'],
        location: _dataMoment['location'],
        imageUrl: _dataMoment['imageUrl'],
        caption: _dataMoment['caption'],
      );
      // Menyimpan object moment ke list _moments
      widget.onSaved(moment);
      // Menutup halaman create moment
      Navigator.of(context).pop();
    }
  }

  void _saveyupiterfilm() {
    if (_formKey.currentState!.validate()) {
      // ganti ke object yupiterfilm
      _formKey.currentState!.save();
      // Membuat object baru
      final yupiterfilm = Yupiterfilm(
        id: nanoid(),
        yupiterfilmdate: _dataYupiter['yupiterfilmdate'],
        judul:  _dataYupiter['judul'],
        genre:  _dataYupiter['genre'],
        daftarpemain:  _dataYupiter['daftarpemain'],
        deskripsi:  _dataYupiter['deskripsi'],
        liketotal:  _dataYupiter['liketotal'],
        savedtotal:  _dataYupiter['savedtotal'],
      );
      // Menyimpan object moment ke list _moments
      widget.onSaved(yupiterfilm);
      // Menutup halaman create moment
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Film'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(largeSize),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Tanggal'),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    hintText: 'Input tanggal',
                    prefixIcon: const Icon(Icons.calendar_month),
                  ),
                  keyboardType: TextInputType.datetime,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter moment date in format yyyy-MM-dd';
                    } else if (DateTime.tryParse(value) == null) {
                      return 'Please enter valid moment date in format yyyy-MM-dd';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    if (newValue != null) {
                      _dataMoment['momentDate'] =
                          DateTime.tryParse(newValue) ?? DateTime.now();
                    }
                  },
                ),
                const Text('Contributor'),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    hintText: 'Nama anda',
                    prefixIcon: const Icon(Icons.person),
                  ),
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter moment creator';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    if (newValue != null) {
                      _dataMoment['creator'] = newValue;
                    }
                  },
                ),
                const Text('Lokasi'),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    hintText: 'Lokasi saat ini',
                    prefixIcon: const Icon(Icons.location_pin),
                  ),
                  keyboardType: TextInputType.streetAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter moment location';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    if (newValue != null) {
                      _dataMoment['location'] = newValue;
                    }
                  },
                ), const Text('Judul),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    hintText: 'Judul film',
                    prefixIcon: const Icon(Icons.note),
                  ),
                  keyboardType: TextInputType.multiline,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Isi keterangan';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    if (newValue != null) {
                      _dataYupiter['judul'] = newValue;
                    }
                  },
                ),
                const Text('Film Cover'),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    hintText: 'Image url',
                    prefixIcon: const Icon(Icons.image),
                  ),
                  keyboardType: TextInputType.url,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan lokasi url valid';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    if (newValue != null) {
                      _dataMoment['imageUrl'] = newValue;
                    }
                  },
                ),
                const Text('Caption'),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    hintText: 'details',
                    prefixIcon: const Icon(Icons.note),
                  ),
                  keyboardType: TextInputType.multiline,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Isi keterangan';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    if (newValue != null) {
                      _dataMoment['caption'] = newValue;
                    }
                  },
                ),
                const SizedBox(height: largeSize),
                SizedBox(
                  height: 50.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    onPressed: _saveMoment,
                    child: const Text('Save'),
                  ),
                ),
                const SizedBox(height: mediumSize),
                SizedBox(
                  height: 50.0,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: OutlinedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: const Text('Cancel'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
