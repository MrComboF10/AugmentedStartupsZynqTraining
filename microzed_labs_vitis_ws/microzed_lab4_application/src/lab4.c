#include <stdio.h>
#include "platform.h"
#include "xgpiops.h"
#include "sleep.h"

#define LED_PIN 47
#define BUTTON_PIN 51

int main()
{
	XGpioPs_Config *GPIO_Config;
	XGpioPs my_Gpio;
	int status;

    init_platform();

    GPIO_Config = XGpioPs_LookupConfig(XPAR_PS7_GPIO_0_DEVICE_ID);

    status = XGpioPs_CfgInitialize(&my_Gpio, GPIO_Config, GPIO_Config->BaseAddr);

    XGpioPs_SetDirectionPin(&my_Gpio, LED_PIN, 1);
    XGpioPs_SetDirectionPin(&my_Gpio, BUTTON_PIN, 1);
    XGpioPs_SetOutputEnablePin(&my_Gpio, LED_PIN, 1);

    while(1) {
    	status = XGpioPs_ReadPin(&my_Gpio, BUTTON_PIN);
    	XGpioPs_WritePin(&my_Gpio, LED_PIN, status);
    }

    cleanup_platform();
    return 0;
}
