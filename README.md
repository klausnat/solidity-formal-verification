Формальная верификация смарт-контрактов на Solidity

В статье речь пойдет об одной из самых глубоких и самых сложных техник верификации смарт-контракта, написанного на Solidity - формальной верификации, использующей в основе SMT-solver. Математическую основу подхода 

Похожий инструмент был разработан и для языка Vyper.

Проверили смарт контракт на предмет соответствия его исходного кода на Solidity скомпилированному байт-коду, хранящемуся в чейне. 
Проверили код с помощью инструментов статического анализа, сделали code-audit.

Первый шаг - проверить, является ли исходные код контракта кодом, который был задеплоин в чейн. Это можно сделать непосредственно в средах разработки, например в Remix, используя Sourcify.

5. Verification Tools

    Sourcify: Decentralized verification alternative (https://sourcify.dev)

    Tenderly: Provides verification and advanced analysis

    Otterscan: Open-source explorer with verification support


Smart contracts on Ethereum and other EVM blockchains are written in human-readable programming languages like Solidity, compiled into bytecode, and stored in bytes on the chain. Humans can't read bytes so this needs to be brought back to human-readable form.

However, if you see a Solidity/Vyper code on Github etc., and someone claims this to be the code of the contract at 0xabc..def, you wouldn't know. Verification makes sure that, that Solidity code is actually the one deployed on-chain.

In simplified terms, we take the Solidity/Vyper code provided by the developer or anyone, compile it, and compare the compiled bytecode with the onchain bytecode at that address 0xabc..def. If they match, the contract is verified.

Source code verification is crucial for transparency and security in blockchains. You should not interact with contracts that are not source-code verified.

Verification does not mean it's safe to interact with a contract. Verifiers do not check the contents of the contracts. These should be cheked by auditors and the community to be deemed safe.

4. Для успешной верификации важно.

    Use exact compiler version that was used for deployment

    Flatten your contracts if using imports (many tools can do this automatically)

    Include all constructor arguments exactly as deployed

    Verify libraries separately if used

    Check optimization settings (runs count must match deployment)

Следующий шаг - проверка самого кода на ошибки и промахи
Использовать инструменты статического анализа, 
Static Analyzer for Solidity
https://github.com/crytic/slither

Вот как много потенциальных ошибок/недостатков кода, которые подобные инструменты позволяют отлавливать. Самые популярные встроены в среды разработки (Hardhat, Foundry, Remix)
https://github.com/crytic/slither/wiki/Detector-Documentation#arbitrary-from-in-transferfrom
