import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

buildCustomAppBar(
        BuildContext context, final Function(int) mudarPaginaCallback) =>
    AppBar(
      backgroundColor: const Color(0xff000232),
      elevation: 0,
      leading: CupertinoButton(
        onPressed: () {},
        padding: EdgeInsets.zero,
        child: const Icon(
          Icons.arrow_back,
          color: Color(0xff00FF76),
        ),
      ),
      actions: [
        IconButton(
          onPressed: null,
          icon: Image.asset('assets/icons/coracao.png', scale: 3.2),
        ),
        IconButton(
          onPressed: null,
          icon: Image.asset('assets/icons/bell.png', scale: 3.2),
        )
      ],
      bottom: TabBar(
        tabAlignment: TabAlignment.start,
        dividerHeight: 0,
        indicatorColor: const Color(0xff00FF76),
        indicatorWeight: 1,
        isScrollable: true,
        labelPadding: const EdgeInsets.all(15),
        labelColor: const Color(0xff00FF76),
        unselectedLabelColor: const Color(0xff7792F0),
        labelStyle: const TextStyle(fontSize: 14),
        padding: const EdgeInsets.only(bottom: 12),
        onTap: (index) => mudarPaginaCallback(index),
        tabs: const [
          Text('Calendário'),
          Text('Jogos'),
          Text('Gols'),
          Text('Under/Over'),
          Text('Outros'),
        ],
      ),
      title: Row(
        children: [
          Image.asset(
            'assets/icons/Escudo.png',
            scale: 4.5,
          ),
          const SizedBox(width: 8),
          const Text('Barcelona',
              style: TextStyle(fontSize: 16, color: Colors.white))
        ],
      ),
      // bottom: ,
    );
