Feature: Non-Discouned Fleet Driver

  Scenario: Non-Discounted Fleet Driver Uses Charger Tariff with Idle Fee - Charging without Incurring Idle Fee (NDD001)
    Given the Non-Discounted Fleet Driver is on the EV Charging screen
    When the Non-Discounted Fleet Driver enters the EVSE with a charger that has a tariff with an idle fee
    Then the Start Charge screen should display:
      """
    * Charging Rate: [Applicable Tariff Rate]
    * Idle Fee Rate: [Idle Fee Rate]
    * Grace Period: [Grace Period Duration]
      """
    When the Non-Discounted Fleet Driver plugs in the cable and starts charging
    Then the charging session should start successfully
    When the Non-Discounted Fleet Driver slides to stop charging after charging several kWh
    Then the End Charge Time is displayed with a reminder to unplug within [grace period] minutes to avoid the idle fee
    When the Non-Discounted Fleet Driver unplugs the cable within the grace period
    Then the Charging Summary screen should display:
      """
    * Charged: [kWh]
    * Fee: [Total Fee Amount]
      """
    And 20 leaves are added to the Non-Discounted Fleet Driver's account for at least 20 kWh charged
    When the Non-Discounted Fleet Driver taps on the "View Transaction Details"
    Then the Transaction Details screen should show:
      """
    * Date/Time: [Date and Time]
    * Paid Via: [Payment Method]
    * Invoice No.: [Invoice Number]
    * Venue: [Location Address]
    * Duration: [Charging Duration]
    * Electricity Consumed: [kWh]
    * Public Rate: [Applicable Tariff Rate]
    * Rewards Earned: [Rewards Points]
    * Idle Fee: Not Applicable
    * Total Amount: [Total Charge Amount]
      """

  Scenario: Non-Discounted Fleet Driver Uses Charger Tariff with Idle Fee - Charging Incurred Idle Fee - Idle Fee Paid by Driver (NDD002)
    Given the Non-Discounted Fleet Driver is on the EV Charging screen
    When the Non-Discounted Fleet Driver enters the EVSE with a charger that has a tariff with an idle fee
    Then the Start Charge screen should display:
      """
    * Charging Rate: [Applicable Tariff Rate]
    * Idle Fee Rate: [Idle Fee Rate]
    * Grace Period: [Grace Period Duration]
      """
    When the Non-Discounted Fleet Driver plugs in the cable and starts charging
    Then the charging session should start successfully
    When the Non-Discounted Fleet Driver slides to stop charging after charging several kWh
    Then the End Charge Time is displayed with a reminder to unplug within [grace period] minutes to avoid the idle fee
    When the Non-Discounted Fleet Driver does not unplug the cable within the grace period
    Then the idle fee is applied to the session
    When the Non-Discounted Fleet Driver unplugs the cable after the grace period
    Then the Charging Summary screen should display:
      """
    * Charged: [kWh]
    * Fee: [Total Fee Amount Including Idle Fee]
      """
    And 20 leaves are added to the Non-Discounted Fleet Driver's account for at least 20 kWh charged
    When the Non-Discounted Fleet Driver taps on the "View Transaction Details"
    Then the Transaction Details screen should show:
      """
    * Date/Time: [Date and Time]
    * Paid Via: [Payment Method]
    * Invoice No.: [Invoice Number]
    * Venue: [Location Address]
    * Duration: [Charging Duration]
    * Electricity Consumed: [kWh]
    * Public Rate: [Applicable Tariff Rate]
    * Rewards Earned: [Rewards Points]
    * Idle Fee: [Applicable Idle Fee]
    * Total Amount: [Total Charge Amount with Idle Fee]
      """

  Scenario: NNon-Discounted Fleet Driver Uses Charger Tariff without Idle Fee (NDD003)
    Given the Non-Discounted Fleet Driver is on the EV Charging screen
    When the Non-Discounted Fleet Driver enters the EVSE with a charger that has a tariff without an idle fee
    Then the Start Charge screen should display:
      """
    * Charging Rate: [Applicable Tariff Rate]
    * Idle Fee Rate: Not Applicable
      """
    When the Non-Discounted Fleet Driver plugs in the cable and starts charging
    Then the charging session should start successfully
    When the Non-Discounted Fleet Driver slides to stop charging after charging several kWh
    Then the End Charge Time is displayed
    When the Non-Discounted Fleet Driver unplugs the cable
    Then the Charging Summary screen should display:
      """
    * Charged: [kWh]
    * Fee: [Total Fee Amount]
      """
    And 20 leaves are added to the Non-Discounted Fleet Driver's account for at least 20 kWh charged
    When the Non-Discounted Fleet Driver taps on the "View Transaction Details"
    Then the Transaction Details screen should show:
      """
    * Date/Time: [Date and Time]
    * Paid Via: [Payment Method]
    * Invoice No.: [Invoice Number]
    * Venue: [Location Address]
    * Duration: [Charging Duration]
    * Electricity Consumed: [kWh]
    * Public Rate: [Applicable Tariff Rate]
    * Rewards Earned: [Rewards Points]
    * Idle Fee: Not Applicable
    * Total Amount: [Total Charge Amount]
      """

  Scenario: Non-Discounted Fleet Driver Uses Charger 0$ Tariff with Idle Fee - Charging without Incurring Idle Fee (NDD004)
    Given the Non-Discounted Fleet Driver is on the EV Charging screen
    When the Non-Discounted Fleet Driver enters the EVSE with a charger that has a 0$ tariff rate and an idle fee
    Then the Start Charge screen should display:
      """
    * Charging Rate: 0$
    * Idle Fee Rate: [Idle Fee Rate]
    * Grace Period: [Grace Period Duration]
      """
    When the Non-Discounted Fleet Driver plugs in the cable and starts charging
    Then the charging session should start successfully
    When the Non-Discounted Fleet Driver slides to stop charging after charging several kWh
    Then the End Charge Time is displayed with a reminder to unplug within [grace period] minutes to avoid the idle fee
    When the Non-Discounted Fleet Driver unplugs the cable within the grace period
    Then the Charging Summary screen should display:
      """
    * Charged: [kWh]
    * Fee: 0$
      """
    And 20 leaves are added to the Non-Discounted Fleet Driver's account for at least 20 kWh charged
    When the Non-Discounted Fleet Driver taps on the "View Transaction Details"
    Then the Transaction Details screen should show:
      """
    * Date/Time: [Date and Time]
    * Transaction No.: [Transaction Number]
    * Venue: [Location Address]
    * Duration: [Charging Duration]
    * Electricity Consumed: [kWh]
    * Idle Fee: Not Applicable
    * No payment is required from you
      """

  Scenario: Non-Discounted Fleet Driver Uses Charger 0$ Tariff with Idle Fee - Charging Incurred Idle Fee - Idle Fee Paid by Driver (NDD005)
    Given the Non-Discounted Fleet Driver is on the EV Charging screen
    When the Non-Discounted Fleet Driver enters the EVSE with a charger that has a 0$ tariff rate and an idle fee
    Then the Start Charge screen should display:
      """
    * Charging Rate: 0$
    * Idle Fee Rate: [Idle Fee Rate]
    * Grace Period: [Grace Period Duration]
      """
    When the Non-Discounted Fleet Driver plugs in the cable and starts charging
    Then the charging session should start successfully
    When the Non-Discounted Fleet Driver slides to stop charging after charging several kWh
    Then the End Charge Time is displayed with a reminder to unplug within [grace period] minutes to avoid the idle fee
    When the Non-Discounted Fleet Driver does not unplug the cable within the grace period
    Then the idle fee is applied to the session
    When the Non-Discounted Fleet Driver unplugs the cable after the grace period
    Then the Charging Summary screen should display:
      """
    * Charged: [kWh]
    * Fee: [Total Fee Amount Including Idle Fee]
      """
    And 20 leaves are added to the Non-Discounted Fleet Driver's account for at least 20 kWh charged
    When the Non-Discounted Fleet Driver taps on the "View Transaction Details"
    Then the Transaction Details screen should show:
      """
    * Date/Time: [Date and Time]
    * Paid Via: [Payment Method]
    * Invoice No.: [Invoice Number]
    * Venue: [Location Address]
    * Duration: [Charging Duration]
    * Electricity Consumed: [kWh]
    * Idle Fee: [Idle Fee Rate]
    * Total Amount: [Total Charge Amount Including Idle Fee]
      """

  Scenario: Non-Discounted Fleet Driver Uses Charger 0$ Tariff without Idle Fee (NDD006)
    Given the Non-Discounted Fleet Driver is on the EV Charging screen
    When the Non-Discounted Fleet Driver enters the EVSE with a charger that has a 0$ tariff rate and no idle fee
    Then the Start Charge screen should display:
      """
    * Charging Rate: 0$
    * Idle Fee: Not Applicable
      """
    When the Non-Discounted Fleet Driver plugs in the cable and starts charging
    Then the charging session should start successfully
    When the Non-Discounted Fleet Driver slides to stop charging after charging several kWh
    Then the End Charge Time is displayed
    When the Non-Discounted Fleet Driver unplugs the cable
    Then the Charging Summary screen should display:
      """
    * Charged: [kWh]
    * Fee: 0$
      """
    And 20 leaves are added to the Non-Discounted Fleet Driver's account for at least 20 kWh charged
    When the Non-Discounted Fleet Driver taps on the "View Transaction Details"
    Then the Transaction Details screen should show:
      """
    * Date/Time: [Date and Time]
    * Transaction No.: [Transaction Number]
    * Venue: [Location Address]
    * Duration: [Charging Duration]
    * Electricity Consumed: [kWh]
    * Idle Fee: Not Applicable
    * No payment is required from you
      """

  Scenario: Non-Discounted Fleet Driver Having No Access to Private Charger Uses Private Charger (NDD007)
    Given the Non-Discounted Fleet Driver is on the EV Charging screen
    When the Non-Discounted Fleet Driver enters an EVSE that belongs to a private charger
    Then the system should display a message: "You don't have access to this charger. Please visit another charger near you."

  Scenario: Non-Discounted Fleet Driver Uses Charger of Landlord GST Registered Location Owner - Charging without Incurring Idle Fee (NDD008)
    Given the Non-Discounted Fleet Driver is on the EV Charging screen
    When the Non-Discounted Fleet Driver enters the EVSE with a charger located at a GST-registered landlord's site
    Then the Start Charge screen should display:
      """
    * Charging Rate: [Applicable Tariff Rate]
    * Idle Fee Rate: [Idle Fee Rate]
    * Grace Period: [Grace Period Duration]
      """
    When the Non-Discounted Fleet Driver plugs in the cable and starts charging
    Then the charging session should start successfully
    When the Non-Discounted Fleet Driver slides to stop charging after charging several kWh
    Then the End Charge Time is displayed with a reminder to unplug within [grace period] minutes to avoid the idle fee
    When the Non-Discounted Fleet Driver unplugs the cable within the grace period
    Then the Charging Summary screen should display:
      """
    * Charged: [kWh]
    * Fee: [Total Fee Amount]
      """
    And 20 leaves are added to the Non-Discounted Fleet Driver's account for at least 20 kWh charged
    When the Non-Discounted Fleet Driver taps on the "View Transaction Details"
    Then the Transaction Details screen should show:
      """
    * Date/Time: [Date and Time]
    * Paid Via: [Payment Method]
    * Invoice No.: [Invoice Number]
    * Venue: [Location Address]
    * Duration: [Charging Duration]
    * Electricity Consumed: [kWh]
    * Public Rate: [Applicable Tariff Rate]
    * Rewards Earned: [Rewards Points]
    * Idle Fee: Not Applicable
    * Total Amount: [Total Charge Amount]
      """
    And the Landlord GST Registered Location Owner and Address are displayed at the bottom of the Transaction Details

  Scenario: Non-Discounted Fleet Driver Uses Charger of Landlord GST Registered Location Owner - Charging Incurred Idle Fee (NDD009)
    Given the Non-Discounted Fleet Driver is on the EV Charging screen
    When the Non-Discounted Fleet Driver enters the EVSE with a charger located at a GST-registered landlord's site
    Then the Start Charge screen should display:
      """
    * Charging Rate: [Applicable Tariff Rate]
    * Idle Fee Rate: [Idle Fee Rate]
    * Grace Period: [Grace Period Duration]
      """
    When the Non-Discounted Fleet Driver plugs in the cable and starts charging
    Then the charging session should start successfully
    When the Non-Discounted Fleet Driver slides to stop charging after charging several kWh
    Then the End Charge Time is displayed with a reminder to unplug within [grace period] minutes to avoid the idle fee
    When the Non-Discounted Fleet Driver does not unplug the cable within the grace period
    Then the idle fee is applied to the session
    When the Non-Discounted Fleet Driver unplugs the cable after the grace period
    Then the Charging Summary screen should display:
      """
    * Charged: [kWh]
    * Fee: [Total Fee Amount Including Idle Fee]
      """
    And 20 leaves are added to the Non-Discounted Fleet Driver's account for at least 20 kWh charged
    When the Non-Discounted Fleet Driver taps on the "View Transaction Details"
    Then the Transaction Details screen should show:
      """
    * Date/Time: [Date and Time]
    * Paid Via: [Payment Method]
    * Invoice No.: [Invoice Number]
    * Venue: [Location Address]
    * Duration: [Charging Duration]
    * Electricity Consumed: [kWh]
    * Public Rate: [Applicable Tariff Rate]
    * Rewards Earned: [Rewards Points]
    * Idle Fee: [Applicable Idle Fee]
    * Total Amount: [Total Charge Amount Including Idle Fee]
      """
    And the Landlord GST Registered Location Owner and Address are displayed at the bottom of the Transaction Details

  Scenario: Non-Discounted Fleet Driver Uses Charger of Non-GST Registered Location Owner - Charging without Incurring Idle Fee (NDD010)
    Given the Non-Discounted Fleet Driver is on the EV Charging screen
    When the Non-Discounted Fleet Driver enters the EVSE with a charger located at a non-GST registered location owner's site (Charging Rate GST = 0)
    Then the Start Charge screen should display:
      """
    * Charging Rate: [Applicable Tariff Rate] (GST = 0)
    * Idle Fee Rate: [Idle Fee Rate]
    * Grace Period: [Grace Period Duration]
      """
    When the Non-Discounted Fleet Driver plugs in the cable and starts charging
    Then the charging session should start successfully
    When the Non-Discounted Fleet Driver slides to stop charging after charging several kWh
    Then the End Charge Time is displayed with a reminder to unplug within [grace period] minutes to avoid the idle fee
    When the Non-Discounted Fleet Driver unplugs the cable within the grace period
    Then the Charging Summary screen should display:
      """
    * Charged: [kWh]
    * Fee: [Total Fee Amount]
      """
    And 20 leaves are added to the Non-Discounted Fleet Driver's account for at least 20 kWh charged
    When the Non-Discounted Fleet Driver taps on the "View Transaction Details"
    Then the Transaction Details screen should show:
      """
    * Date/Time: [Date and Time]
    * Paid Via: [Payment Method]
    * Invoice No.: [Invoice Number]
    * Venue: [Location Address]
    * Duration: [Charging Duration]
    * Electricity Consumed: [kWh]
    * Public Rate: [Applicable Tariff Rate]
    * Rewards Earned: [Rewards Points]
    * Idle Fee: Not Applicable
    * Total Amount: [Total Charge Amount]
      """
    And the Non-GST Registered Location Owner and Address are displayed at the bottom of the Transaction Details

  Scenario: Non-Discounted Fleet Driver Uses Charger of Non-GST Registered Location Owner - Charging Incurred Idle Fee - Idle Fee Paid by Driver (NDD011)
    Given the Non-Discounted Fleet Driver is on the EV Charging screen
    When the Non-Discounted Fleet Driver enters the EVSE with a charger located at a non-GST registered location owner's site (Charging Rate GST = 0)
    Then the Start Charge screen should display:
      """
    * Charging Rate: [Applicable Tariff Rate]
    * Idle Fee Rate: [Idle Fee Rate]
    * Grace Period: [Grace Period Duration]
      """
    When the Non-Discounted Fleet Driver plugs in the cable and starts charging
    Then the charging session should start successfully
    When the Non-Discounted Fleet Driver slides to stop charging after charging several kWh
    Then the End Charge Time is displayed with a reminder to unplug within [grace period] minutes to avoid the idle fee
    When the Non-Discounted Fleet Driver does not unplug the cable within the grace period
    Then the idle fee is applied to the session
    When the Non-Discounted Fleet Driver unplugs the cable after the grace period
    Then the Charging Summary screen should display:
      """
    * Charged: [kWh]
    * Fee: [Total Fee Amount with Idle Fee]
      """
    And 20 leaves are added to the Non-Discounted Fleet Driver's account for at least 20 kWh charged
    When the Non-Discounted Fleet Driver taps on the "View Transaction Details"
    Then the Transaction Details screen should show:
      """
    * Date/Time: [Date and Time]
    * Paid Via: [Payment Method]
    * Invoice No.: [Invoice Number]
    * Venue: [Location Address]
    * Duration: [Charging Duration]
    * Electricity Consumed: [kWh]
    * Public Rate: [Applicable Tariff Rate]
    * Rewards Earned: [Rewards Points]
    * Idle Fee: [Applicable Idle Fee]
    * Total Amount: [Total Charge Amount with Idle Fee]
      """
    And the Non-GST Registered Location Owner and Address are displayed at the bottom of the Transaction Details