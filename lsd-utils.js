const { ethers } = require("ethers");

/**
 * Calculates the current exchange rate for the LSD token
 */
async function getExchangeRate(lsdContract) {
    const totalPooledEth = await ethers.provider.getBalance(await lsdContract.getAddress());
    const totalSupply = await lsdContract.stToken().then(addr => {
        const token = new ethers.Contract(addr, ["function totalSupply() view returns (uint256)"], ethers.provider);
        return token.totalSupply();
    });

    if (totalSupply === 0n) return 1.0;
    return Number(totalPooledEth) / Number(totalSupply);
}

module.exports = { getExchangeRate };
