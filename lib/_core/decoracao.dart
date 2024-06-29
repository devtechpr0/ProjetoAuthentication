import "package:flutter/material.dart";
import "package:projeto_authentication/_core/minhas_cores.dart";

InputDecoration getAuthenticationInputDecoration(String label,
    {Widget? suffixIcon}) {
  return InputDecoration(
      hintText: label,
      fillColor: MyColors.cinzaClaro,
      filled: true,
      suffixIcon: suffixIcon,
      hintStyle: const TextStyle(
        color: MyColors.cinzaEscuro,
        fontStyle: FontStyle.italic,
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: MyColors.cinzaEscuro, width: 2)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: MyColors.azulEscuro, width: 4)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: MyColors.vermelho, width: 2)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: MyColors.vermelho, width: 4)));
}
