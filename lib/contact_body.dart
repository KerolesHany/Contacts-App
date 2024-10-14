import 'package:contact/widgets/contact_btn.dart';
import 'package:contact/widgets/default_text_field.dart';
import 'package:contact/widgets/visible_contact.dart';
import 'package:flutter/material.dart';

class ContactBody extends StatefulWidget {
  const ContactBody({super.key});

  @override
  State<ContactBody> createState() => _ContactBodyState();
}

class _ContactBodyState extends State<ContactBody> {
  GlobalKey<FormState> globalKey = GlobalKey();

  @override
  //! Lify Cycle in Statefull widget (init -> dispose)
  void initState() {
    // will call it in start of lifeCycle the this widget in widget tree
    super.initState();
  }

  @override
  void dispose() {
    // will call it in end of lifeCycle the this widget in widget tree
    phoneControlloer.dispose();
    nameControlloer.dispose();
    /*
    ! Discards any resources used by the object. After this is called, 
    ! the object is not in a usable state and should be discarded 
    */
    super.dispose();
  }

  @override
  VisibleContact visibleConatct1 = VisibleContact();
  VisibleContact visibleConatct2 = VisibleContact();
  VisibleContact visibleConatct3 = VisibleContact();

  TextEditingController nameControlloer = TextEditingController();
  TextEditingController phoneControlloer = TextEditingController();
  int numberOfVisibleItem = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Form(
        key: globalKey,
        child: Column(
          children: [
            DefualtTextField(
              controller: nameControlloer,
              text: "Name",
              icon: const Icon(
                Icons.edit,
                color: Colors.blue,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            DefualtTextField(
              controller: phoneControlloer,
              text: "Number",
              icon: const Icon(
                Icons.phone,
                color: Colors.blue,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            DefaultButton(
              text: "Add",
              onPressed: addItem,
              color: const Color(0xff2196F3),
            ),
            const SizedBox(
              height: 15,
            ),
            visibleConatct1,
            visibleConatct2,
            visibleConatct3,
          ],
        ),
      ),
    );
  }

  addItem() {
    if (globalKey.currentState!.validate()) {
      //! => validate function
      /*
      Validates every [FormField] that is a descendant of this [Form], 
      and returns true if there are no errors.
      => no errors in valiator if return null in validtor in textformfield
      */
      if (numberOfVisibleItem == 0) {
        visibleConatct1 = VisibleContact(
          isVisible: true,
          name: nameControlloer.text,
          number: phoneControlloer.text,
          index: 1,
          onDelete: deleteItem,
        );
      } else if (numberOfVisibleItem == 1) {
        visibleConatct2 = VisibleContact(
          isVisible: true,
          name: nameControlloer.text,
          number: phoneControlloer.text,
          onDelete: deleteItem,
          index: 2,
        );
      } else if (numberOfVisibleItem == 2) {
        visibleConatct3 = VisibleContact(
            isVisible: true,
            name: nameControlloer.text,
            onDelete: deleteItem,
            index: 3,
            number: phoneControlloer.text);
      } else {
        return;
      }

      numberOfVisibleItem++;
      setState(() {});
      nameControlloer.clear();
      // set the value empty
      phoneControlloer.clear();
    } else {
      print("This Feld can't be empty");
    }
  }

  deleteItem(int index) {
    if (index == 1) {
      visibleConatct1 = VisibleContact(
        isVisible: false,
      );
      // Form -> key -> formstate->valiator-> will return true if all textFeild valid or have no erros (reutrn null)
    } else if (index == 2) {
      visibleConatct2 = VisibleContact(
        isVisible: false,
      );
    } else if (index == 3) {
      visibleConatct3 = VisibleContact(
        isVisible: false,
      );
    } else {
      return;
    }

    numberOfVisibleItem--;
    setState(() {});
  }
}
