import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/ui/routes/single_movie_details/person_details/person_cubit/person_cubit.dart';
import 'package:movie_app_flutter/ui/routes/single_movie_details/person_details/person_details_page.dart';


class PersonDetails extends StatefulWidget {
  final personId;
  const PersonDetails({Key key, this.personId});
  @override
  _CastDetailState createState() => _CastDetailState();
}

class _CastDetailState extends State<PersonDetails> {
PersonCubit personCubit = PersonCubit();

  @override
  void initState() {
    super.initState();
personCubit.getPerson(id: widget.personId);
  }

  @override
  void dispose() {
personCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      cubit: personCubit,
      builder: (context, state) {
        if (state.persons == null)
        return _buildLoadingWidget();
        else return PersonDetailsPage(persons: state.persons,);

      },
    );
  }
}
Widget _buildLoadingWidget() {
  return Scaffold(
    appBar: AppBar(backgroundColor: Colors.grey[900],),
    body: Center(
      child: CircularProgressIndicator(),
       ),
  );
}
