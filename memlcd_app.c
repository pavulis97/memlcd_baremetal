/***************************************************************************//**
 * @file memlcd_app.c
 * @brief Memory Liquid Crystal Display (LCD) example functions
 *******************************************************************************
 * # License
 * <b>Copyright 2020 Silicon Laboratories Inc. www.silabs.com</b>
 *******************************************************************************
 *
 * The licensor of this software is Silicon Laboratories Inc. Your use of this
 * software is governed by the terms of Silicon Labs Master Software License
 * Agreement (MSLA) available at
 * www.silabs.com/about-us/legal/master-software-license-agreement. This
 * software is distributed to you in Source Code format and is governed by the
 * sections of the MSLA applicable to Source Code.
 *
 ******************************************************************************/
#include <stdio.h>

#include "sl_board_control.h"
#include "sl_simple_button_instances.h"
#include "em_assert.h"
#include "glib.h"
#include "dmd.h"

/*******************************************************************************
 *******************************   DEFINES   ***********************************
 ******************************************************************************/

#ifndef BUTTON_INSTANCE_0
#define BUTTON_INSTANCE_0   sl_button_btn0
#endif

#ifndef BUTTON_INSTANCE_1
#define BUTTON_INSTANCE_1   sl_button_btn1
#endif

#ifndef LCD_MAX_LINES
#define LCD_MAX_LINES      127
#endif

#ifndef LINE_LENGTH
#define LINE_LENGTH         127
#endif

#ifndef SPACING_AFTER_STRING
#define SPACING_AFTER_STRING         2
#endif

#ifndef FONT_HEIGHT
#define FONT_HEIGHT         8
#endif

#ifndef STRING_Y_OFFSET
#define STRING_Y_OFFSET         0
#endif

#ifndef SPACING_AFTER_LINE
#define SPACING_AFTER_LINE         1
#endif



/*******************************************************************************
 ***************************  LOCAL VARIABLES   ********************************
 ******************************************************************************/
static GLIB_Context_t glibContext;
static int currentHLine             = 0;
static int currentVLine             = 0;
static int horizontalLineCounter    = 0;
static int stringCounter            = 0;
static bool bootScreen              = true;

typedef enum {
  HORIZONTAL_LINE,
  STRING
} LAST_LINE_STATUS;

LAST_LINE_STATUS lastLineStatus;

/*******************************************************************************
 **************************   GLOBAL FUNCTIONS   *******************************
 ******************************************************************************/
static void reset_counters(void);
static void draw_line(void);
static void draw_string(void);
/***************************************************************************//**
 * Initialize example.
 ******************************************************************************/
void memlcd_app_init(void)
{
  uint32_t status;

  /* Enable the memory lcd */
  status = sl_board_enable_display();
  EFM_ASSERT(status == SL_STATUS_OK);

  /* Initialize the DMD support for memory lcd display */
  status = DMD_init(0);
  EFM_ASSERT(status == DMD_OK);

  /* Initialize the glib context */
  status = GLIB_contextInit(&glibContext);
  EFM_ASSERT(status == GLIB_OK);

  glibContext.backgroundColor = White;
  glibContext.foregroundColor = Black;

  /* Fill lcd with background color */
  GLIB_clear(&glibContext);

  /* Use Narrow font */
  GLIB_setFont(&glibContext, (GLIB_Font_t *) &GLIB_FontNarrow6x8);

  /* Draw text on the memory lcd display*/
  GLIB_drawStringOnLine(&glibContext,
                        "MEMLCD Sample App",
                        currentHLine++,
                        GLIB_ALIGN_LEFT,
                        0,
                        STRING_Y_OFFSET,
                        true);
  stringCounter++;

  GLIB_drawStringOnLine(&glibContext,
                        " Press BTN0 to clear",
                        currentHLine++,
                        GLIB_ALIGN_LEFT,
                        0,
                        STRING_Y_OFFSET,
                        true);
  stringCounter++;

  GLIB_drawStringOnLine(&glibContext,
                        " Press BTN1 to print",
                        currentHLine,
                        GLIB_ALIGN_LEFT,
                        0,
                        STRING_Y_OFFSET,
                        true);
  stringCounter++;

  lastLineStatus = STRING;

  DMD_updateDisplay();
}

/***************************************************************************//**
 * Ticking function.
 ******************************************************************************/
void memlcd_app_process_action(void)
{
  return;
}

/***************************************************************************//**
 * Callback on button change.
 *
 * This function overrides a weak implementation defined in the simple_button
 * module. It is triggered when the user activates one of the buttons.
 *
 ******************************************************************************/
void sl_button_on_change(const sl_button_t *handle)
{
  if (sl_button_get_state(handle) == SL_SIMPLE_BUTTON_PRESSED) {
    if (&BUTTON_INSTANCE_0 == handle) {
      reset_counters();
      lastLineStatus = HORIZONTAL_LINE;

      GLIB_clear(&glibContext);
    } else if (&BUTTON_INSTANCE_1 == handle) {
      if (currentHLine > LCD_MAX_LINES) {
        currentHLine = 0;
        reset_counters();
        GLIB_clear(&glibContext);
      }

      if (lastLineStatus == STRING) {
        draw_line();
      } else if (lastLineStatus == HORIZONTAL_LINE) {
        draw_string();
      }
    }
    DMD_updateDisplay();
  }
}

void reset_counters(void)
{
      currentHLine            = 0;
      stringCounter           = 0;
      horizontalLineCounter   = 0;
}

void draw_line(void)
{
  currentHLine    = stringCounter * FONT_HEIGHT + SPACING_AFTER_STRING * horizontalLineCounter;
  
  GLIB_drawLineH(&glibContext, 0, currentHLine, LINE_LENGTH);
  lastLineStatus  = HORIZONTAL_LINE;

  horizontalLineCounter++;
}

void draw_string(void)
{
  if (currentHLine == 0){

  } else {
    currentHLine = 2 + currentHLine - (stringCounter * FONT_HEIGHT) + stringCounter - SPACING_AFTER_STRING * horizontalLineCounter;
  }

  GLIB_drawStringOnLine(&glibContext,
                          "Hello World!",
                          currentHLine,
                          GLIB_ALIGN_LEFT,
                          0,
                          STRING_Y_OFFSET,
                          true);
  stringCounter++;
  lastLineStatus = STRING;
}