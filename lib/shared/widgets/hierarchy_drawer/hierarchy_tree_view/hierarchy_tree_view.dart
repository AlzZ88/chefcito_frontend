import 'package:frontend_template/feature_1/domain/models/model.dart';
import 'package:frontend_template/shared/constants.dart';
import 'package:frontend_template/shared/repositories/logbook_repository.dart';
import 'package:frontend_template/shared/widgets/hierarchy_drawer/hierarchy_tree_view/widgets/hierarchy_node.dart';
import 'package:flutter/material.dart';
import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:frontend_template/feature_1/domain/models/model.dart' as models;

class HierarchyTreeView extends StatefulWidget {
  const HierarchyTreeView({super.key});

  @override
  State<HierarchyTreeView> createState() => _HierarchyTreeViewState();
}

class _HierarchyTreeViewState extends State<HierarchyTreeView> {
  Future<Plant> fetchData() async {
    var response =
        await LogBookAPI().get_query(LOGBOOK_HOST, "hierarchy/plant/");
    List<Plant> plants = models.plantFromJson(response);
    return plants[0];
  }

  TreeNode buildTreeView(Plant plant) {
    TreeNode root = TreeNode(key: plant.name);

    for (var section in plant.sections) {
      TreeNode sectionNode = TreeNode(key: section.name);

      for (var equipment in section.equipments) {
        TreeNode equipmentNode = TreeNode(key: equipment.name);
        sectionNode.add(equipmentNode);
      }

      root.add(sectionNode);
    }

    return root;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Plant>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          Plant plant = snapshot.data!;
          TreeNode rootNode = buildTreeView(plant);

          return Container(
            color: const Color.fromARGB(255, 7, 57, 107),
            width: MediaQuery.of(context).size.width,
            child: TreeView.simple(
              tree: rootNode,
              showRootNode: true,
              expansionIndicatorBuilder: (context, node) =>
                  ChevronIndicator.rightDown(
                tree: node,
                color: const Color.fromARGB(255, 255, 255, 255),
                padding: const EdgeInsets.all(8),
              ),
              indentation: const Indentation(
                  style: IndentStyle.squareJoint,
                  color: Color.fromARGB(0, 255, 255, 255)),
              builder: (context, node) => SizedBox(
                height: 30,
                child: Card(
                    elevation: 0,
                    color: const Color.fromARGB(255, 7, 57, 107),
                    child: HierarchyNode(
                        name: node.key, state: "verde", level: node.level)),
              ),
            ),
          );
        } else {
          return const Text('No data available');
        }
      },
    );
  }
}
