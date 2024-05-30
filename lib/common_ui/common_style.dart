import 'package:flutter/material.dart';

Widget input(
    {String? labelText,
    TextEditingController? controller,
    bool? obscureText,
    ValueChanged<String>? onChanged}) {
  return TextField(
    controller: controller,
    onChanged: onChanged,
    obscureText: obscureText ?? false,
    style: const TextStyle(color: Colors.deepPurple),
    decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.deepPurple, width: 1),
            borderRadius: BorderRadius.circular(6)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.deepPurple, width: 1.5),
            borderRadius: BorderRadius.circular(6)),
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.deepPurple)),
  );
}

Widget button({required String text, GestureTapCallback? onTap}) {
  return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.deepPurple, borderRadius: BorderRadius.circular(24)),
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ));
}

Widget articleListItem(
    {num type = 0,
    bool collect = false,
    String? title,
    String? chapter,
    String? dateText,
    String? author,
    GestureTapCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.only(left: 14, top: 12, right: 14, bottom: 12),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: const BorderRadius.all(Radius.circular(6))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: Image.network(
                  "https://img0.baidu.com/it/u=3115458040,1714553382&fm=253&fmt=auto&app=138&f=JPEG?w=750&h=500",
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(author ?? ""),
              const Expanded(child: SizedBox()),
              Text(
                dateText ?? "",
                style: const TextStyle(fontSize: 12),
              ),
              type == 1
                  ? Container(
                      margin: const EdgeInsets.only(
                          left: 5, top: 0, right: 0, bottom: 0),
                      padding: const EdgeInsets.only(
                          left: 2, top: 0, right: 2, bottom: 0),
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          border: Border.all(color: Colors.transparent),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4))),
                      child: const Text(
                        "TOP",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            title ?? "",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(
                chapter ?? "",
                style: const TextStyle(color: Colors.deepPurple, fontSize: 10),
              ),
              const Expanded(child: SizedBox()),
              Icon(
                Icons.favorite,
                color: collect ? Colors.redAccent : Colors.black12,
                size: 22,
              )
            ],
          )
        ],
      ),
    ),
  );
}
