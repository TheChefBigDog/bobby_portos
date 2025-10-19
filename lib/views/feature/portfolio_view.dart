import 'package:bobby_portfolio/constant/app_asset.dart';
import 'package:bobby_portfolio/modules/portfolio/portfolio_controller.dart';
import 'package:bobby_portfolio/views/feature/career_journey.dart';
import 'package:bobby_portfolio/views/feature/on_boarding.dart';
import 'package:bobby_portfolio_package/navbar/template/nav_template.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PortfolioView extends StatelessWidget {
  const PortfolioView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenH = MediaQuery.of(context).size.height;
    final headerH = screenH * 0.12;

    final scrollController = ScrollController();
    final careerJourneyKey = GlobalKey();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(headerH),
        child: PortfolioHeader(heightFraction: 0.12, logoAsset: AppAssets.myName),
      ),
      body: GetBuilder<PortfolioController>(
        builder: (controller) {
          return SingleChildScrollView(
            controller: scrollController,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  OnBoardingSection(
                    onDownPressed: () {
                      Scrollable.ensureVisible(
                        careerJourneyKey.currentContext!,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                  CareerJourneySection(key: careerJourneyKey),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
