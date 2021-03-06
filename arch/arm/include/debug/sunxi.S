/*
 * Early serial output macro for Allwinner A1X SoCs
 *
 * Copyright (C) 2012 Maxime Ripard
 *
 * Maxime Ripard <maxime.ripard@free-electrons.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
*/

#if defined(CONFIG_DEBUG_SUNXI_UART0)

#ifdef CONFIG_ARCH_SUNIVW1
#define SUNXI_UART_DEBUG_PHYS_BASE 0x01c25000
#define SUNXI_UART_DEBUG_VIRT_BASE 0xf1c25000
#else
#define SUNXI_UART_DEBUG_PHYS_BASE 0x01c28000
#define SUNXI_UART_DEBUG_VIRT_BASE 0xf1c28000
#endif

#elif defined(CONFIG_DEBUG_SUNXI_UART1)

#ifdef CONFIG_ARCH_SUNIVW1
#define SUNXI_UART_DEBUG_PHYS_BASE 0x01c25400
#define SUNXI_UART_DEBUG_VIRT_BASE 0xf1c25400
#else
#define SUNXI_UART_DEBUG_PHYS_BASE 0x01c28400
#define SUNXI_UART_DEBUG_VIRT_BASE 0xf1c28400
#endif

#endif

	.macro	addruart, rp, rv, tmp
	ldr	\rp, =SUNXI_UART_DEBUG_PHYS_BASE
	ldr	\rv, =SUNXI_UART_DEBUG_VIRT_BASE
	.endm

#define UART_SHIFT	2
#include <asm/hardware/debug-8250.S>
