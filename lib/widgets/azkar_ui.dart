import 'package:flutter/material.dart';

class AzkarPageScaffold extends StatelessWidget {
  const AzkarPageScaffold({
    super.key,
    required this.title,
    required this.subtitle,
    required this.accentColor,
    required this.itemCount,
    required this.itemBuilder,
    this.onHomePressed,
    this.onPlayAudioPressed,
  });

  final String title;
  final String subtitle;
  final Color accentColor;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;

  final VoidCallback? onHomePressed;
  final VoidCallback? onPlayAudioPressed;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          _BackgroundPattern(
            accentColor: accentColor,
          ),

          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {

                final horizontalPadding =
                    constraints.maxWidth >= 900 ? 32.0 : 16.0;

                final contentWidth =
                    constraints.maxWidth >= 900
                        ? 860.0
                        : double.infinity;


                return Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: contentWidth,
                    ),

                    child: Column(
                      children: [


                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            horizontalPadding,
                            12,
                            horizontalPadding,
                            12,
                          ),

                          child: _PageHeader(
                            title: title,
                            subtitle: subtitle,
                            onHomePressed: onHomePressed,
                            onPlayAudioPressed: onPlayAudioPressed,
                          ),
                        ),



                        Expanded(
                          child: CustomScrollView(
                            slivers: [

                              SliverPadding(
                                padding: EdgeInsets.fromLTRB(
                                  horizontalPadding,
                                  0,
                                  horizontalPadding,
                                  32,
                                ),

                                sliver: SliverList.separated(
                                  itemCount: itemCount,
                                  itemBuilder: itemBuilder,

                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height:14),
                                ),
                              ),

                            ],
                          ),
                        ),


                      ],
                    ),
                  ),
                );

              },
            ),
          ),

        ],
      ),
    );
  }
}





class AzkarContentCard extends StatelessWidget {

  const AzkarContentCard({
    super.key,
    required this.indexLabel,
    required this.arabicText,
    required this.englishText,
    required this.amharicText,
    required this.repeatCount,
    required this.accentColor,
  });


  final String indexLabel;
  final String arabicText;
  final String englishText;
  final String amharicText;
  final int repeatCount;
  final Color accentColor;



  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);


    return Card(
      color: Colors.black,

      child: Padding(
        padding: const EdgeInsets.all(18),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [


            Row(
              children: [

                Text(
                  indexLabel,
                  style: theme.textTheme.labelLarge,
                ),


                const Spacer(),


                Text(
                  '${repeatCount}x',

                  style: theme.textTheme.labelLarge?.copyWith(
                    color: accentColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],
            ),



            const SizedBox(height:16),



            Directionality(
              textDirection: TextDirection.rtl,

              child: Text(
                arabicText,

                textAlign: TextAlign.right,

                style: theme.textTheme.titleLarge?.copyWith(
                  height:1.8,
                  fontSize:20,
                  fontWeight:FontWeight.w600,
                ),
              ),
            ),



            if (englishText.isNotEmpty) ...[

              const SizedBox(height:12),

              Text(
                englishText,
              ),

            ],



            if (amharicText.isNotEmpty) ...[

              const SizedBox(height:8),

              Text(
                amharicText,

                style: TextStyle(
                  color:accentColor,
                  fontWeight:FontWeight.w600,
                ),
              ),

            ],


          ],
        ),
      ),
    );
  }
}






class AzkarHomeTile extends StatelessWidget {

  const AzkarHomeTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.accentColor,
    required this.onTap,
  });


  final String title;
  final String subtitle;
  final IconData icon;
  final Color accentColor;
  final VoidCallback onTap;



  @override
  Widget build(BuildContext context) {

    return InkWell(

      borderRadius: BorderRadius.circular(28),

      onTap:onTap,


      child: Ink(

        padding:const EdgeInsets.all(20),


        decoration:BoxDecoration(

          borderRadius:BorderRadius.circular(28),

          gradient:LinearGradient(

            colors:[

              accentColor.withOpacity(.22),

              accentColor.withOpacity(.08),

            ],
          ),
        ),



        child:Column(

          crossAxisAlignment:CrossAxisAlignment.start,

          mainAxisAlignment:MainAxisAlignment.spaceBetween,


          children:[


            Icon(
              icon,
              color:accentColor,
              size:32,
            ),



            Text(
              title,

              style:Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(
                    fontWeight:FontWeight.bold,
                  ),
            ),



            Text(
              subtitle,

              style:Theme.of(context)
                  .textTheme
                  .bodyMedium,
            ),


          ],
        ),
      ),
    );
  }
}







class _BackgroundPattern extends StatelessWidget {


  const _BackgroundPattern({
    required this.accentColor,
  });


  final Color accentColor;



  @override
  Widget build(BuildContext context) {


    return DecoratedBox(

      decoration:BoxDecoration(

        gradient:LinearGradient(

          begin:Alignment.topCenter,

          end:Alignment.bottomCenter,


          colors:[

            accentColor.withOpacity(.20),

            const Color(0xFF071410),

            const Color(0xFF05100D),

          ],
        ),
      ),


      child:const SizedBox.expand(),

    );
  }
}







class _PageHeader extends StatelessWidget {


  const _PageHeader({

    required this.title,

    required this.subtitle,

    required this.onHomePressed,

    this.onPlayAudioPressed,

  });



  final String title;

  final String subtitle;

  final VoidCallback? onHomePressed;

  final VoidCallback? onPlayAudioPressed;





  @override
  Widget build(BuildContext context) {


    final theme = Theme.of(context);



    return Column(

      crossAxisAlignment:CrossAxisAlignment.start,


      children:[



        Row(

          children:[



            IconButton(

              onPressed:onHomePressed ??
                  ()=>Navigator.maybePop(context),


              icon:const Icon(
                Icons.arrow_back_rounded,
              ),

            ),





            Expanded(

              child:Text(

                title,


                style:theme.textTheme.titleLarge?.copyWith(

                  fontWeight:FontWeight.w800,

                  fontSize:20,

                ),

              ),

            ),





            if(onPlayAudioPressed != null)

              IconButton(

                onPressed:onPlayAudioPressed,


                icon:const Icon(

                  Icons.play_circle_fill_sharp,

                ),

              ),


          ],
        ),





        Text(

          subtitle,


          style:theme.textTheme.bodyMedium?.copyWith(

            color:Colors.white70,

          ),

        ),


      ],
    );
  }
}