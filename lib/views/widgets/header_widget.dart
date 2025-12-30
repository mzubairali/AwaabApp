import 'package:flutter/material.dart';
import 'package:cmsapp/util/responsive.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //final supabase = Supabase.instance.client;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (!Responsive.isDesktop(context))
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(Icons.menu, color: Colors.grey, size: 25),
              ),
            ),
          ),
        /*
        if (!Responsive.isMobile(context))
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: cardBackgroundColor,
                hintText: 'Search',

                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),

                contentPadding: const EdgeInsets.symmetric(vertical: 5),

                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 21,
                ),
              ),
            ),
          ),
*/
        if (Responsive.isMobile(context))
          Row(
            children: [
              /*
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search, color: Colors.grey, size: 25),
              ),
              
              InkWell(
                //onTap: () => Scaffold.of(context).openEndDrawer(),
                onTap: () async {
                  await supabase.auth.signOut();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                    (value) => false,
                  );
                },
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  //child: Image.asset("lib/assets/icons/Fire.png", width: 32),
                  child: Icon(Icons.exit_to_app),
                ),
              ),
              */
            ],
          ),
      ],
    );
  }
}
