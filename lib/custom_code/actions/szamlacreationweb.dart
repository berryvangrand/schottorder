// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'dart:html' as html;
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:xml/xml.dart';

Future<bool> szamlacreationweb(
  String? datum,
  String? emailcim,
  String? vevonev,
  String? irszam,
  String? telepulesneve,
  String? vevocim,
  String? tetelmegnevezes,
  int? tetelmennyiseg,
  double? nettoegysegar,
  double? nettoar,
  double? bruttoar,
  double? afaertek,
) async {
  // Add your function code here!

  final xmlString = '''<?xml version="1.0" encoding="UTF-8" ?>
<xmlszamla xmlns="http://www.szamlazz.hu/xmlszamla" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <beallitasok>
      <szamlaagentkulcs>i26w7h86etfcwdr6cxyeuxdt5ziiw37v2epg5u5bpd</szamlaagentkulcs>
      <eszamla>true</eszamla>
      <szamlaLetoltes>false</szamlaLetoltes>
    </beallitasok>
    <fejlec>
      <keltDatum></keltDatum>
      <teljesitesDatum></teljesitesDatum>
      <fizetesiHataridoDatum></fizetesiHataridoDatum>
      <fizmod>Bankkártya</fizmod>
      <penznem>HUF</penznem>
      <szamlaNyelve>hu</szamlaNyelve>
      <megjegyzes/>
      <arfolyamBank>MNB</arfolyamBank>
      <arfolyam>0</arfolyam>
      <rendelesSzam>73</rendelesSzam>
      <elolegszamla>false</elolegszamla>
      <vegszamla>false</vegszamla>
      <helyesbitoszamla>false</helyesbitoszamla>
      <dijbekero>false</dijbekero>
      <szamlaszamElotag>NB</szamlaszamElotag>
    </fejlec>
    <elado>
<bank></bank>
<bankszamlaszam>1122334455667788</bankszamlaszam>
<emailReplyto>info@becsikapu.hu</emailReplyto>
<emailTargy>Schott menü rendelés</emailTargy>
 <emailSzoveg>Köszönjük a vásárlást!</emailSzoveg>
</elado>
<vevo>
<nev>BB</nev>
<irsz>9725</irsz>
<telepules>Kőszegszerdahely</telepules>
<cim>Kossuth Lajos utca 38.</cim>
<email>berryvangrand@gmail.com</email>
 <sendEmail>true</sendEmail>
<adoszam/>
<azonosito/>
<telefonszam>06305861838</telefonszam>
<megjegyzes/>
</vevo>
<fuvarlevel/>
<tetelek>
<tetel>
<megnevezes>Schott</megnevezes>
<mennyiseg>1</mennyiseg>
<mennyisegiEgyseg>db</mennyisegiEgyseg>
 <nettoEgysegar>3000</nettoEgysegar>
<afakulcs>5</afakulcs>
<nettoErtek>3000</nettoErtek>
<afaErtek>0</afaErtek>
<bruttoErtek>3000</bruttoErtek>
<megjegyzes/>
</tetel>
</tetelek>
</xmlszamla>

''';
  final document = XmlDocument.parse(xmlString);

  // Edit the XML document here

  // Itt az XMl van szerkesztve!!!!!

  final keltDatum = document.findAllElements('keltDatum').first;
  keltDatum.children.clear();

  keltDatum.children.add(XmlText(datum!));

  final teljesitesDatum = document.findAllElements('teljesitesDatum').first;
  teljesitesDatum.children.clear();

  teljesitesDatum.children.add(XmlText(datum!));

  // Szamlaadatok

  final fizetesiHataridoDatum =
      document.findAllElements('fizetesiHataridoDatum').first;
  fizetesiHataridoDatum.children.clear();

  fizetesiHataridoDatum.children.add(XmlText(datum!));

  final vevoNev = document.findAllElements('nev').first;
  vevoNev.children.clear();
  vevoNev.children.add(XmlText(vevonev!));

  final irsz = document.findAllElements('irsz').first;
  irsz.children.clear();
  irsz.children.add(XmlText(irszam!));

  final telepules = document.findAllElements('telepules').first;
  telepules.children.clear();
  telepules.children.add(XmlText(telepulesneve!));

  final cim = document.findAllElements('cim').first;
  cim.children.clear();
  cim.children.add(XmlText(vevocim!));

  final email = document.findAllElements('email').first;
  email.children.clear();
  email.children.add(XmlText(emailcim!));

  // Vevoadatai

  final megnevezes = document.findAllElements('megnevezes').first;
  megnevezes.children.clear();
  megnevezes.children.add(XmlText(tetelmegnevezes!));

  final mennyiseg = document.findAllElements('mennyiseg').first;
  mennyiseg.children.clear();
  mennyiseg.children.add(XmlText(tetelmennyiseg.toString()));

  final nettoEgysegar = document.findAllElements('nettoEgysegar').first;
  nettoEgysegar.children.clear();
  nettoEgysegar.children.add(XmlText(nettoegysegar.toString()));

  final nettoErtek = document.findAllElements('nettoErtek').first;
  nettoErtek.children.clear();
  nettoErtek.children.add(XmlText(nettoar.toString()));

  final afaErtek = document.findAllElements('afaErtek').first;
  afaErtek.children.clear();
  afaErtek.children.add(XmlText(afaertek.toString()));

  final bruttoErtek = document.findAllElements('bruttoErtek').first;
  bruttoErtek.children.clear();
  bruttoErtek.children.add(XmlText(bruttoar.toString()));

  // Telekek

  //Eddig van az XML szerksztve!!!!!

  // Convert the XML document to a Uint8List
  final xmlBytes =
      utf8.encode(document.toXmlString(pretty: true, indent: '\t'));

  // Print the XML content to the log
  print(utf8.decode(xmlBytes));

  final xmlList = Uint8List.fromList(xmlBytes);

  // Create a MultipartFile from the Uint8List
  final file = http.MultipartFile.fromBytes(
    'action-xmlagentxmlfile',
    xmlList,
    filename: 'szamla.xml',
    contentType: MediaType('application', 'xml'),
  );

  // Send the file to the API
  final request = http.MultipartRequest(
    'POST',
    Uri.parse('https://corsproxy.io/?https://www.szamlazz.hu/szamla/'),
  );
  request.headers['Access-Control-Allow-Origin'] = '*'; // Add this line
  request.files.add(file);

  final response = await request.send();

// Print the status code and response body
  print('Status code: ${response.statusCode}');
  final respStr = await response.stream.bytesToString();
  print('Response body: $respStr');

// Return true if the API call is successful, otherwise return false
  return response.statusCode == 200;
}
