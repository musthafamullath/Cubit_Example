import 'package:crud_cubit/src/cubits/cubit/cubit_users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cubit App'),
          centerTitle: true,
        ),
        body: BlocBuilder<CubitUsersCubit, CubitUsersState>(
          
          builder: (context, state) {
            if (state is CubitUsersLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CubitUsersLoaded) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListView.builder(
                  itemCount: state.users.length,
                  itemBuilder: (context, index) {
                    final user = state.users[index];
                    return Card(
                      child: ListTile(
                        leading: const Icon(Icons.person),
                        title: Text(
                          user.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Username: ${user.username}'),
                            Text('Email: ${user.email}'),
                            Text('Phone: ${user.phone}'),
                            Text('Website: ${user.website}'),
                            const SizedBox(height: 5),
                            Text('Address: ${user.address.street}, ${user.address.suite}, ${user.address.city}, ${user.address.zipcode}'),
                            Text('Company: ${user.company.name} - ${user.company.catchPhrase}'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            } else if(state is CubitUsersError) {
              return  Center(
                child: Text(state.message),
              );
            } else{
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
