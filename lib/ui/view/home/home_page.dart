import 'package:curiumlife/core/enum/view_state.dart';
import 'package:curiumlife/core/res/colors.dart';
import 'package:curiumlife/core/res/images.dart';
import 'package:curiumlife/core/res/spacing.dart';
import 'package:curiumlife/core/res/styles.dart';
import 'package:curiumlife/ui/view/widget/patient_info_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:stacked/stacked.dart';

import 'homepage_view_model.dart';

class HomePage extends ViewModelBuilderWidget<HomePageViewModel> {
  @override
  void onViewModelReady(HomePageViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.init();
  }

  @override
  HomePageViewModel viewModelBuilder(BuildContext context) =>
      HomePageViewModel();
  int touchedIndex = -1;

  @override
  Widget builder(
      BuildContext context, HomePageViewModel viewModel, Widget? child) {
    return Scaffold(
        body: viewModel.state == ViewState.Busy
            ? Container()
            : getBody(context, viewModel));
  }

  getBody(context, viewModel) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .4,
            //  color: Colors.red,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .3,
                  alignment: Alignment.topCenter,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(Images.background),
                          fit: BoxFit.cover)),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Surgery Details",
                        style: AppTextStyle.headline5.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.italic),
                      ),
                      GestureDetector(
                        onTap: () {
                          viewModel.logout();
                        },
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xFFCCF5E1)),
                          alignment: Alignment.center,
                          child: const Image(
                            image: AssetImage(Images.ic_logout),
                            width: 14,
                            height: 16.73,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(left: 16, right: 16),
                    padding: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height * .25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    alignment: Alignment.center,
                    child: viewModel.patientsList.length == 0
                        ? Text("No Data Found")
                        : Container(
                            alignment: Alignment.topCenter,
                            child: Column(
                              children: [
                                Expanded(
                                  child: AspectRatio(
                                    aspectRatio: 2,
                                    child: PieChart(
                                      PieChartData(
                                          pieTouchData: PieTouchData(
                                              touchCallback:
                                                  (FlTouchEvent event,
                                                      pieTouchResponse) {}),
                                          borderData: FlBorderData(
                                            show: false,
                                          ),
                                          sectionsSpace: 0,
                                          centerSpaceRadius: 40,
                                          sections: [
                                            pieChartSectionDataWidget(
                                              viewModel.oneCVCPercentage,
                                              Color(0xFF4485FD),
                                            ),
                                            pieChartSectionDataWidget(
                                              viewModel.secondCVCPercentage,
                                              Color(0xFFA584FF),
                                            ),
                                            pieChartSectionDataWidget(
                                              viewModel.thirdCVCPercentage,
                                              Color(0xFFFF7854),
                                            ),
                                            pieChartSectionDataWidget(
                                              viewModel.fourCVCPercentage,
                                              Color(0xFFFEA725),
                                            ),
                                            pieChartSectionDataWidget(
                                              viewModel.fiveCVCPercentage,
                                              Color(0xFF00CC6A),
                                            ),
                                            pieChartSectionDataWidget(
                                              viewModel.sixCVCPercentage,
                                              Color(0xFF00C9E4),
                                            ),
                                          ]),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 6,
                                          width: 6,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFF4485FD),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          "value-01",
                                          style: TextStyle(fontSize: 10),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 6,
                                          width: 6,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFA584FF),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          "value-02",
                                          style: TextStyle(fontSize: 10),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 6,
                                          width: 6,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFFF7854),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          "value-03",
                                          style: TextStyle(fontSize: 10),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 6,
                                          width: 6,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFFEA725),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          "value-04",
                                          style: TextStyle(fontSize: 10),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 6,
                                          width: 6,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFF00CC6A),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          "value-05",
                                          style: TextStyle(fontSize: 10),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 6,
                                          width: 6,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFF00C9E4),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          "value-06",
                                          style: TextStyle(fontSize: 10),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
          VerticalSpacing.custom(value: 12),
          viewModel.patientsList.isEmpty
              ? Center(
                  child: Container(
                    height: 300,
                    alignment: Alignment.center,
                    child: Text(
                      "No Patients data found ",
                      style: AppTextStyle.subtitle2
                          .copyWith(color: Colors.black.withOpacity(.5)),
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: AnimationLimiter(
                    child: GridView.count(
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: .85,
                      primary: false,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(8.0),
                      crossAxisCount: 2,
                      children: List.generate(
                        viewModel.patientsList.length,
                        (int index) {
                          return AnimationConfiguration.staggeredGrid(
                            columnCount: 2,
                            position: index,
                            duration: Duration(milliseconds: 500),
                            child: ScaleAnimation(
                              scale: 0.5,
                              child: FadeInAnimation(
                                child: PatientInfoWidget(
                                    viewModel.patientsList[index]),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
          VerticalSpacing.custom(value: 100),
        ],
      ),
    );
  }

  PieChartSectionData pieChartSectionDataWidget(double value, Color color) {
    return PieChartSectionData(
      color: color,
      value: value,
      title: '${value ?? 0}%',
      radius: 40,
      titleStyle: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: const Color(0xffffffff)),
    );
  }
}
