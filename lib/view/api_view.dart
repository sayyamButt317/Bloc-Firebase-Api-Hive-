import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msb_task3/bloc/api/api_event.dart';
import '../bloc/api/api_bloc.dart';
import '../bloc/api/api_state.dart';
import '../enum/status.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({super.key});

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ApiBloc>().add(PostFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Screen'),
        centerTitle: true,
      ),
      body: BlocBuilder<ApiBloc, ApiState>(
        builder: (context, state) {
          switch (state.postStatus) {
            case TaskStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case TaskStatus.failure:
              return Center(child: Text(state.message.toString()));
            case TaskStatus.success:
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Search',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (filtervalue) {
                        context.read<ApiBloc>().add(SearchItem(filtervalue));
                      },
                    ),
                  ),
                  Expanded(
                    child: state.searchMessage.isNotEmpty
                        ? Center(child: Text(state.searchMessage.toString()))
                        : ListView.builder(
                            itemCount: state.temPostList.isEmpty
                                ? state.postList.length
                                : state.temPostList.length,
                            itemBuilder: (context, index) {
                              if (state.temPostList.isNotEmpty) {
                                final item = state.temPostList[index];
                                return ListTile(
                                  leading: CachedNetworkImage(
                                    imageUrl: item.avatar ?? '',
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                            colorFilter: const ColorFilter.mode(
                                                Colors.red,
                                                BlendMode.colorBurn)),
                                      ),
                                    ),
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 8),
                                      SizedBox(
                                        width: double.infinity,
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child:
                                              Text('Name: ${item.firstName}'),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                    ],
                                  ),
                                );
                              } else {
                                final item = state.postList[index];
                                return ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(item.avatar ?? ''),
                                  ),
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 8),
                                      SizedBox(
                                        width: double.infinity,
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child:
                                              Text('Name: ${item.firstName}'),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                    ],
                                  ),
                                );
                              }
                            },
                          ),
                  ),
                ],
              );
            default:
              return Container();
          }
        },
      ),
    );
  }
}
