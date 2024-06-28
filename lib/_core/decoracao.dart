import "package:flutter/material.dart";
import "package:projeto_authentication/_core/minhas_cores.dart";

InputDecoration getAuthenticationInputDecoration(String label) {
  return InputDecoration(
    hintText: label,
    fillColor: MyColors.cinzaClaro,
    filled: true,
    alignLabelWithHint: true,
    hintStyle: const TextStyle(
      color: MyColors.cinzaEscuro,
      fontStyle: FontStyle.italic,
    ),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
  );
}
